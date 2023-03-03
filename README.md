# Dotfiles

```
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
```

<a href="https://github.com/jeffreytse/dotfiles/actions/workflows/tests.yml">
  <img src="https://github.com/jeffreytse/dotfiles/actions/workflows/tests.yml/badge.svg"
    alt="build" />
</a>
<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-brightgreen.svg"
    alt="License: MIT" />
</a>
<a href="https://liberapay.com/jeffreytse">
  <img src="https://img.shields.io/liberapay/goal/jeffreytse.svg?logo=liberapay"
    alt="Donate (Liberapay)" />
</a>
<a href="https://patreon.com/jeffreytse">
  <img src="https://img.shields.io/badge/support-patreon-F96854.svg?style=flat-square"
    alt="Donate (Patreon)" />
</a>
<a href="https://ko-fi.com/jeffreytse">
  <img height="20" src="https://www.ko-fi.com/img/githubbutton_sm.svg"
    alt="Donate (Ko-fi)" />
</a>

All the configuration and scripts needed by myself, proper dotfiles are the
very heart of an efficient working environment, no more, no less.

All configurations are managed by [Ansible](https://github.com/ansible/ansible),
it's a little more complex than [GNU Stow](https://www.gnu.org/software/stow/),
[dotbot](https://github.com/anishathalye/dotbot), but much features rich to
bootstrap my environment.

Please NOTE that this project isn't a distro, it's intended for my personal
usage, and perhaps some inspiration, _not complete duplication_. If you see
something weird or wrong please raise an issue instead.

![screenshot](https://user-images.githubusercontent.com/9413601/222759361-bdcda143-9ca3-449e-b0f2-07b62d009f3a.png)

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
  - [starship](https://github.com/starship/starship)
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
