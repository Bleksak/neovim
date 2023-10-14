# Bleksak's neovim

Use archlinux

`git clone https://github.com/Bleksak/neovim ~/.config/nvim`

## Get healthy
- Clipboard support
    `yay -S xclip`

- Telescope grep
    `yay -S ripgrep`

- Neovim python support
    ```
    yay -S python-pynvim
    ```

- Neovim node support
    ```
    yay -S nvm
    nvm install node
    npm i -g neovim
    ```

Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

- If you use laravel:
    `sudo cp laravel-dev-tools /usr/bin/laravel-dev-tools`

Then run nvim:
```
:checkhealth
```

TODO: write some bash script to automate all this
