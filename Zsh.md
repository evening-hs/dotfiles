# Zsh

1. Install `zsh` from your package manager.
2. Install **Oh My Zsh** [(read instructions)](https://ohmyz.sh/#install).

   ```sh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
3. Install `zsh-syntax-highlighting` [(read instructions).](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)

   ````bash
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   ````
4. Install `zsh-autosuggestions` [(read instructions).](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)

   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   ```
5. Copy the dotfile

## Dotfile:

**First read the instructions above**

`.zshrc` goes in `~/.zshrc`