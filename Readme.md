# My Nix configuration

Repository containing my `dotfiles` configuration, managed via [home manager](https://nix-community.github.io/home-manager/index.html). The original intention is not to configure a full NixOS system, but my daily machine, which runs Ubuntu. In the future I may try to use NixOS as daily computer system.

- [My Nix configuration](#my-nix-configuration)
  - [Install](#install)
    - [Dependencies](#dependencies)
    - [Install Nix](#install-nix)
    - [Activate the configuration](#activate-the-configuration)
  - [How to's](#how-tos)
    - [Calculate the sha256 has of a Git repository](#calculate-the-sha256-has-of-a-git-repository)
  - [Resources](#resources)

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

Create a symbolic link called `home.nix` to the machine it is installed.

```bash
ln -s juno.nix home.nix
```

Create a symbolic link from the `~/.config` folder to this repository.

```bash
ln -s ~/Projects/nix-conf ~/.config/home-manager
```

Then activate the configuration with

```bash
home-manager switch
```

For using the Fish shell managed by Home Manager together with the other goodies, setup your favorite terminal emulator to start the following command:

```bash
/home/user/.nix-profile/bin/tmux new-session -A
```

## How to's

[Cheatsheet](./Cheatsheet.md) with key bindings for tmux and neovim.

### Calculate the sha256 has of a Git repository

Despite what says [here](https://github.com/NixOS/nixpkgs/issues/191128) or [here](https://stackoverflow.com/questions/31659527/what-is-the-meaning-of-sha256-in-nixpkgs-fetchgit-where-does-the-value-come-fro), the only way I found to make it work is letting it fail the first time and then use the Hash calculated by Nix.

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

## Resources

- [A list of new-ish command line tools](https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/)
- [Home Manager manual](https://nix-community.github.io/home-manager/)
- [Home Manager options](https://rycee.gitlab.io/home-manager/options.html)
- [NixOS Wiki](https://nixos.wiki/wiki/Main_Page)
- [NixOS Package search](https://search.nixos.org/packages?channel=23.05&size=50&sort=relevance&type=packages&query=python311+venv)
- [NixOS Discourse](https://discourse.nixos.org/)
- [Wimpy's NixOS & Home Manager Configurations](https://github.com/wimpysworld/nix-config/tree/039e2f0151b03b9a3aa2991230a6becf75d91c43)
- [How to: Use Nix on Ubuntu](https://tech.aufomm.com/my-nix-journey-use-nix-with-ubuntu/#Install-Nix)
- [How to: Getting started with Home Manager for Nix](https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix)
