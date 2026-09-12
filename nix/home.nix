{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "eveningg";
  home.homeDirectory = "/home/eveningg";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.rquickshare
    pkgs.git
    pkgs.tree-sitter
    pkgs.clang
    pkgs.python3
    pkgs.fastfetch
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/eveningg/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    QT_STYLE_OVERRIDE = pkgs.lib.mkForce "adwaita-dark";
  };

  # How do I enable this?
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = { # "ohMyZsh" without Home Manager
      enable = true;
      plugins = [ ];
      theme = "garyblessington";
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        # disable-user-extensions = true; # Optionally disable user extensions entirely
        enabled-extensions = [
          # Put UUIDs of extensions that you want to enable here.
          # If the extension you want to enable is packaged in nixpkgs,
          # you can easily get its UUID by accessing its extensionUuid
          # field (look at the following example).
          # pkgs.gnomeExtensions.gsconnect.extensionUuid
          # ===
          # Important: This is enable, to install, go to the main nixos config
          # ===

          # Alternatively, you can manually pass UUID as a string.
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.just-perfection.extensionUuid
          pkgs.gnomeExtensions.dash-to-dock.extensionUuid
          # ...
        ];
      };

      # Configure individual extensions
      # "org/gnome/shell/extensions/blur-my-shell" = {
      #   brightness = 0.75;
      #   noise-amount = 0;
      # };
    };
  };

  # programs.neovim = {
  #   viAlias = true;
  #   vimAlias = true;
  #   enable = true;
  #   extraConfig = lib.fileContents ../../.config/nvim/init.lua;
  # };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

# vim: tabstop=2 shiftwidth=2 expandtab
