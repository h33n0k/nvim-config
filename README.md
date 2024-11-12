***Welcome to my Neovim configuration!***

This setup is tailored to enhance my coding experience with Neovim, providing a streamlined and efficient environment for various programming projects.

![preview](https://github.com/h33n0k/nvim-config/blob/main/demo.png?raw=true)

### Available on

![Static Badge](https://img.shields.io/badge/-linux-none?style=for-the-badge&logo=linux&logoColor=%23FFFFFF&labelColor=%23363A4F&color=%23a6da95)
![Static Badge](https://img.shields.io/badge/-mac-none?style=for-the-badge&logo=apple&logoColor=%23FFFFFF&labelColor=%23363A4F&color=%23a6da95)
![Static Badge](https://img.shields.io/badge/-windows-none?style=for-the-badge&logo=gnometerminal&logoColor=%23FFFFFF&labelColor=%23363A4F&color=%23a6da95)

### Installation :
#### Unix like :
```bash
# backup current config (optional)
mv ~/.config/nvim/ ~/.config/nvim.backup/
```
```bash
# clone repository
git clone https://github.com/h33n0k/nvim-config.git ~/.config/nvim/
```
```bash
# Sync plugins
:PackerSync
```

#### Windows :
```bash
# backup current config (optional)
mv $env:LOCALAPPDATA/nvim/ $env:LOCALAPPDATA/nvim.backup/
```
```bash
# clone repository
git clone https://github.com/h33n0k/nvim-config.git $env:LOCALAPPDATA/nvim/
```
```bash
# Sync plugins
:PackerSync
```

* * *

# Features

#### Completions :
>Experience seamless and intelligent auto-completion in this Neovim setup, thanks to the advanced [Language Server Protocol](https://en.wikipedia.org/wiki/Language_Server_Protocol) integration. LSP ensures context-aware suggestions while typing, leveraging a deep understanding of the codebase. Real-time error checking, precise code navigation, and on-the-fly documentation retrieval enhance the coding experience, fostering efficiency and accuracy in development workflows.

#### Writting Experience
>The meticulous selection of plugins in this Neovim configuration aims to create a simple and intuitive writing flow. Each plugin has been carefully chosen to enhance specific aspects of the writing process, ensuring a seamless user experience.

#### Interface
>This Neovim interface embodies a sleek and intuitive design, emphasizing simplicity and practicality. With a clean layout and a carefully chosen color scheme, the interface maintains a distraction-free environment, promoting focus on code. Intuitive keybindings and thoughtful organization contribute to a user-friendly experience, ensuring both seasoned developers and newcomers can easily navigate the minimalist yet functional design for efficient coding and text editing.

# Contributing

If you spot anything that needs a touch-up don't be shy !
Let me know or even whip up a `pull request`.

Should a hiccup come your way, give the `:checkhealth` command in nvim a spin for some DIY troubleshooting.
Take a moment to delve into the details of the health check messages, they hold the clues you need.

If you still have an issue, [open a new issue](https://github.com/h33n0k/nvim-config/issues).
