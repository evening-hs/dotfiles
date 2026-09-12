# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.luks.devices."luks-fc96475a-769b-4b22-ac45-0feb0438ccba".device = "/dev/disk/by-uuid/fc96475a-769b-4b22-ac45-0feb0438ccba";
  boot = {
    plymouth.enable = true;
  };
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  qt = {
    enable = true;
    style = "adwaita-dark";
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  hardware.bluetooth.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_CA.UTF-8";
    LC_IDENTIFICATION = "en_CA.UTF-8";
    LC_MEASUREMENT = "en_CA.UTF-8";
    LC_MONETARY = "en_CA.UTF-8";
    LC_NAME = "en_CA.UTF-8";
    LC_NUMERIC = "en_CA.UTF-8";
    LC_PAPER = "en_CA.UTF-8";
    LC_TELEPHONE = "en_CA.UTF-8";
    LC_TIME = "en_CA.UTF-8";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the Plasma Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  # Disable unnecesary gnome apps
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  # services.displayManager.plasma-login-manager.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "mac";
  };

  # Install input-remapper
  services.input-remapper = {
    enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # enable flatpak
  services.flatpak.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  services.udev = {
    enable = true;
    extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0660", GROUP="users", TAG+="uaccess"
    # Configure 2.4GHz keychron
    SUBSYSTEM=="usb",  ATTRS{idVendor}=="3434", ATTRS{idProduct}=="d030", MODE="0660", GROUP="users", TAG+="uaccess"
    '';
  };

  # antivirus
  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;

  # syncthing
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    group = "users";
    user = "eveningg";
    dataDir = "/home/eveningg/Documents/";
    configDir = "/home/eveningg/.config/syncthing";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."eveningg" = {
    isNormalUser = true;
    description = "Evelyn Itzel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  programs = {
    gamemode.enable = true;
    steam.enable = true;
    zsh.enable = true;
    firefox.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam.gamescopeSession.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        libsecret
      ];
    };
  };

  users.defaultUserShell = pkgs.zsh;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    kitty
    google-chrome
    wireguard-tools
    proton-vpn
    clamav
    gnome-tweaks
    distrobox

    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-dock
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.firewall = {
    enable = true;
    checkReversePath = false;
    allowedTCPPorts = [ 36381 ];

  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}

# vim: ts=2 sw=2 et
