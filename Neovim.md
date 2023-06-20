# Neovim

1. Install neovim >= 8.0

   **openSUSE**

   ````bash
   sudo zypper install neovim
   ````

2. Install [vim plug.](https://github.com/junegunn/vim-plug#unix-linux)

   ```sh
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   ```

3. Install `node`.

   **openSUSE**

   ````bash
   sudo zypper install nodejs-default
   ````

4. For C/C++ support:

   1. Install `clang`

      **openSUSE**

      ```bash
      sudo zypper install clang
      ```

5. For Python support:

   1. Install `jedi`

      ```python
      pip install jedi-language-server
      ```

6. For Java support:

   1. Install java

      **openSUSE**

      ```bash
      sudo zypper install java-20-openjdk-devel
      ```

7. Copy the file `init.vim` to `~/.config/nvim/init.vim`.

8. Run Neovim and install the plugs:

   ````bash
   nvim +PlugInstall
   ````

   Or else just `nvim` and once inside run `:PlugInstall`.

   

