# Dotfiles

```
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

All the configuration and scripts needed by myself, proper dotfiles are the
very heart of an efficient working environment, no more, no less. All
configurations are managed by [Ansible](https://github.com/ansible/ansible).

## Setup

Cloning Dotfiles

```sh
git clone git@github.com:jeffreytse/dotfiles.git
```

Navigate to the project directory and run the `setup.sh` playbook.

```sh
cd dotfiles && ./setup.sh
```

## Manifest

- Terminals:
  - [wezterm](https://github.com/wez/wezterm)
  - [tmux](https://github.com/tmux/tmux)
- Shell:
  - [zsh](https://www.zsh.org/)
  - [zinit](https://github.com/zdharma-continuum/zinit)
- Editor:
  - [neovim](https://github.com/neovim/neovim)
- Theme:
  - [Dracula](https://draculatheme.com/)
  - [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- Font:
  - Fira Code from Nerd Fonts
- Browser:
  - [nnn](https://github.com/jarun/nnn)
- Version Manager:
  - [asdf](https://github.com/asdf-vm/asdf)
- Others:
  - cmatrix
- ...


## Contributing

Issues and Pull Requests are greatly appreciated. If you've never contributed to an open source project before I'm more than happy to walk you through how to create a pull request.

You can start by [opening an issue](https://github.com/jeffreytse/dotfiles/issues/new) describing the problem that you're looking to resolve and we'll go from there.


## License

This project is licensed under the [MIT license](https://opensource.org/licenses/mit-license.php) © Jeffrey Tse.
