# My Nix configuration

Repository containing my `dotfiles` configuration, managed via [home manager](<https://nix-community.github.io/home-manager/index.html>). The original intention is not to configure a full NixOS system, but my daily machine, which runs Ubuntu. In the future I may try to use NixOS as daily computer system.

- [My Nix configuration](#my-nix-configuration)
- [Overview](#overview)
- [Install](#install)
- [Dependencies](#dependencies)
- [Install Nix](#install-nix)
- [Activate the configuration](#activate-the-configuration)
- [How to's](#how-tos)
- [Calculate the sha256 has of a Git repository](#calculate-the-sha256-has-of-a-git-repository)
- [An specific environment for Python](#an-specific-environment-for-python)
- [Resources](#resources)
- [TODOs](#todos)

## Overview

The home manager configuration of this repository includes tools like:

- [bat](<https://github.com/sharkdp/bat>): A cat(1) clone with wings.
- [chafa](<https://hpjansson.org/chafa/>): Terminal graphics for the 21st century.
- [deadnix](<https://github.com/astro/deadnix>): Scan Nix files for dead code.
- [diffr](<https://github.com/mookid/diffr>): Yet another diff highlighting tool.
- [direnv](<https://direnv.net/>): Get into a folder and automatically load `.env` files
- [du-dust](<https://github.com/bootandy/dust>): A more intuitive version of `du` in Rust.
- [dua](<https://github.com/Byron/dua-cli>): View disk space usage and delete unwanted data, fast.
- [duf](<https://github.com/muesli/duf>): Disk Usage/Free Utility - a better 'df' alternative.
- [exa](<https://the.exa.website/>): A modern replacement for ls.
- [fd](<https://github.com/sharkdp/fd>): A simple, fast and user-friendly alternative to 'find'.
- [fish shell](<https://fishshell.com>): A smart and user-friendly command line shell for Linux, macOS, and the rest of the family. See [fish.nix](./home-manager/apps/fish.nix) and [config.fish](./home-manager/apps/config.fish).
- With [aliases](<https://fishshell.com/docs/current/cmds/alias.html>) for cat, diff, etc...
- With [abbreviations](<https://fishshell.com/docs/current/cmds/abbr.html>) for git
- The [grc](<https://github.com/oh-my-fish/plugin-grc>) plugin. `grc` Colourizer for some commands.
- [pure](<https://github.com/pure-fish/pure>) Pretty, minimal, and fast prompt for Fish shell inspired by sindresorhus/pure.
- [colored-man-pages](<https://github.com/PatrickF1/colored_man_pages.fish>) plugin. Fish shell plugin to colorize man pages.
- [bass](<https://github.com/edc/bass>). Make Bash utilities usable in Fish shell.
- [sponge](<https://github.com/meaningful-ooo/sponge>) plugin. Clean fish history from typos automatically.
- [pisces](<https://github.com/laughedelic/pisces>) plugin. Helps you to work with paired symbols in the command line.
- [autovenv](<https://github.com/mmartinortiz/fish-autovenv>) plugin. Enable Python environments automatically.
- git: By now you should now what this is.
- [glow](<https://github.com/charmbracelet/glow>): Render markdown on the CLI.
- [gping](<https://github.com/orf/gping>): Ping, but with a graph.
- [grc](<https://github.com/garabik/grc>): Generic colouriser.
- [neovim](<https://neovim.io/>): An iteration over the Great Vim, with focus on new interfaces. The configuration is strongly inspired (mostly copied) from [this NeoVim config](<https://github.com/workflow/nixos-config/blob/5fb8b79b17e8edf3ac800179f6e2dfc75fa8bd22/home/neovim.nix>)
- [nixpkgs-fmt](<https://nix-community.github.io/nixpkgs-fmt/>): Nix code formatter for nixpkgs.
- [procs](<https://github.com/dalance/procs>): A modern replacement for ps written in Rust.
- Python 3.11, with `pip`, `pipx` and `virtualenv`. This means that you do not depend on your distribution's Python.
- [ripgrep](<https://github.com/BurntSushi/ripgrep>): recursively searches directories for a regex pattern while respecting your gitignore.
- [tldr](<https://tldr.sh/>): Collaborative cheat-sheets for console commands.
- [vim](<https://www.vim.org/>): The ubiquitous text editor.
- [wget2](<https://gitlab.com/gnuwget/wget2>): The successor of GNU Wget.
- Fonts: [Hack](<https://sourcefoundry.org/hack/>), [Ubuntu Mono](<https://design.ubuntu.com/font>) and [FiraCode](<https://github.com/tonsky/FiraCode>).

This list would be out of date. For a full reference check the [`home.nix`](./home-manager/home.nix) file. It also does other things, like setting up `fish` as the default shell for the user (via Bash, because `chsh` cannot see `Home-manager`'s fish installation), install plugins for Vim or setting the default editor to Vim. For a full always up to date reference, check the [`home.nix`](./home-manager/home.nix) file.

## Install

### Dependencies

- git
- curl

```bash
sudo apt install --yes git curl
```

### Install Nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

After installing `nix` reopen the terminal for reloading the `PATH` variable.

### Activate the configuration

This configuration uses the [fish shell](<https://fishshell.com/>) as main shell. Because the configuration has been written with Ubuntu in mind, the `fish` shell installed via home manager is not recognized by `chsh`. For making `fish` the default shell, this is started from `bash` on start via a modification of the `~/.bashrc` file. Probably the system where the configuration is deployed already contains a `.bashrc` file. For getting this configuration running, make a backup of the current `.bashrc` file.

```shell
# Backup the current bashrc
mv ~/.bashrc ~/.bashrc.backup

# From the 'nix-conf' folder
nix run nixpkgs#home-manager -- switch --flake .

# Alternatively
nix run nixpkgs#home-manager -- switch --flake <path_to>/nix-conf/
```

## How to's

### Calculate the sha256 has of a Git repository

Despite what says [here](<https://github.com/NixOS/nixpkgs/issues/191128>) or [here](<https://stackoverflow.com/questions/31659527/what-is-the-meaning-of-sha256-in-nixpkgs-fetchgit-where-does-the-value-come-fro>), the only way I found to make it work is letting it fail the first time and then use the Hash calculated by Nix.

```nix
{
name = "fish-autovenv";
src = pkgs.fetchFromGitHub {
owner = "mmartinortiz";
repo = "fish-autovenv";
rev = "1.0.0";
sha256 = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
};
}
```

```bash
error: hash mismatch in fixed-output derivation '/nix/store/yldav2adi4kr8ypfx0swsvgvzsc6wkfk-source.drv':
specified: sha256-zBB5Ow4FfzhM8QXRT0E174ZHessf1OU57K8co+ReuFw=
got:     sha256-f6ib/XcgnKGYbhfZca0PMScbHgZP2nMqF5hEbyG0Afo= # Use this one.
```

## An specific environment for Python

If you create a Python virtual environment using the `pip` command installed by Home Manager, it will fail to compile some Python packages, like Numpy or iPython, that require of `libstdc`. One solution is to install those packages via Nix.

But if you need/want to use a Virtual Environment in you Python project, you have then two options:

1. When creating the virtual environment for the Python project, use the system's Python interpreter instead of the Nix's Python interpreter.
2. Start a `nix-shell` that mounts the "host" file system to the shell. There is an example in `python-shell.nix` that can be run with `nix-shell python-shell.nix`.

## NeoVim

Some of the things it brings:

- LSP for Python with Pyright, CMP (completion plugin) and [treesitter](https://github.com/tree-sitter/tree-sitter).
- [BarBar](https://github.com/romgrk/barbar.nvim): The neovim tabline plugin.
- [LuaLine](https://github.com/nvim-lualine/lualine.nvim): A blazing fast and easy to configure neovim statusline plugin written in pure lua.
- [Autopairs](https://github.com/windwp/nvim-autopairs): Autopairs for neovim written by lua.
- [ToggleTerm](https://github.com/akinsho/toggleterm.nvim): A neovim lua plugin to help easily manage multiple terminal windows.
- [NeoTree](https://github.com/nvim-neo-tree/neo-tree.nvim): Neovim plugin to manage the file system and other tree like structures.
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers.
- [Telescope](https://github.com/nvim-telescope/telescope.nvim): Find, Filter, Preview, Pick. Files and more.

Some things to be done:

- [x] Tree browser (NeoTree), add key bindings
- [x] Key bindings for autocompletion
- [x] Key bindings for commenting code
- [x] Jump to last edited line
- [ ] Which key plugin

Keyboard mappings. More about notations, [here](<https://neovim.io/doc/user/intro.html#key-notation>)

```
# By default, the leader key is \

# ToggleTerm - Normal mode
<leader>tf  # Floating terminal
<ledaer>th  # Horizontal terminal
<leader>tv  # Vertical terminal
<C-\>       # Toggle terminal (default direction)

# Comments - Normal and Visual Mode
<C-/>  # Toggle comments

# Completion - Insert Mode
<C-Space>  # Trigger completion
<CR>       # Accept completion
<C-j>      # Move up on completion list
<C-k>      # Move down on completion list

# Telescope
<leader>ff   # Telescope find_files
<leader>fg   # Telescope live_grep
<leader>fb   # Telescope buffers
<leader>fh   # Telescope help_tags
<leader>fk   # Telescope keymaps
<leader>fp   # Telescope commands

# More on https://github.com/nvim-telescope/telescope.nvim#default-mappings

# Barbar. Reordering tabs
<m-s-j>  # Move next tab
<m-s-k>  # Move previous tab
<m-p>    # Pin tab

# Barbar. Navigating tabs
<m-j>  # Move to next tab
<m-k>  # Move to previous tab
<m-X>  # Move to X tab (from 1 to 9)
<m-0>  # Move to last tab

# Barbar. Close tab
<m-x>  # Close tab

# Neotree
<C-b>  # Toggle Neotree visibility
```

## Resources

- [A list of new-ish command line tools](<https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/>)
- [Home Manager manual](<https://nix-community.github.io/home-manager/>)
- [Home Manager options](<https://rycee.gitlab.io/home-manager/options.html>)
- [NixOS Wiki](<https://nixos.wiki/wiki/Main_Page>)
- [NixOS Package search](<https://search.nixos.org/packages?channel=23.05&size=50&sort=relevance&type=packages&query=python311+venv>)
- [NixOS Discourse](<https://discourse.nixos.org/>)
- [Wimpy's NixOS & Home Manager Configurations](<https://github.com/wimpysworld/nix-config/tree/039e2f0151b03b9a3aa2991230a6becf75d91c43>)
- [How to: Use Nix on Ubuntu](<https://tech.aufomm.com/my-nix-journey-use-nix-with-ubuntu/#Install-Nix>)
- [How to: Getting started with Home Manager for Nix](<https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix>)

## TODOs

- [ ] Incorporate fish functions
- [ ] Install Go
- [ ] Install Rust
- [ ] Python programs, via `pipx`?
- [ ] ipython
- [ ] mu-editor
- [ ] esptool
- [ ] Arduino IDE
- [ ] Profiles per computer
- [ ] Try a desktop (Can I change the desktop on Ubuntu via Home Manager?)
- [ ] Can this be reused for different usernames?
