# My Nix configuration

## Dependencies

- git
- curl

```bash
sudo apt install --yes git curl
```

## Install Nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

After installing `nix` reopen the terminal for reloading the `PATH` variable.

## Install Home Manager

```bash
nix run home-manager/master -- init --switch
```

If you are getting below error, please check if FOLDER `~/.local/state/nix/profiles` exists, otherwise create it manually.

```bash
Could not find suitable profile directory, tried /home/<username>/.local/state/home-manager/profiles and /nix/var/nix/profiles/per-user/user
```

## Activate the configuration

This configuration uses the [fish shell]() as main shell. Because the configuration has been written with Ubuntu in mind, the `fish` shell installed via home manager is not recognized by `chsh`. For making `fish` the default shell, this is started from `bash` on start via a modification of the `~/.bashrc` file. Probably the system where the configuration is deployed already contains a `.bashrc` file. For getting this configuration running, make a backup of the current `.bashrc` file.

```shell
# Backup the current bashrc
mv ~/.bashrc ~/.bashrc.backup

# From the 'nix-conf' folder
nix run nixpkgs#home-manger -- switch --flake .

# Alternatively

nix run nixpkgs#home-manger -- switch --flake <path_to>/nix-conf/
```

## Calculate the sha256 has of a Git repository

Despite what says [here](<https://github.com/NixOS/nixpkgs/issues/191128>) or [here](<https://stackoverflow.com/questions/31659527/what-is-the-meaning-of-sha256-in-nixpkgs-fetchgit-where-does-the-value-come-fro>), the only way I found to make it "work" is letting it fail the first time and then use the Hash calculated by Nix

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

- [Home Manager manual](<https://nix-community.github.io/home-manager/>)
- [Home Manager options](<https://rycee.gitlab.io/home-manager/options.html>)
- [NixOS Wiki](<https://nixos.wiki/wiki/Main_Page>)
- [NixOS Package search](<https://search.nixos.org/packages?channel=23.05&size=50&sort=relevance&type=packages&query=python311+venv>)
- [NixOS Discourse](<https://discourse.nixos.org/>)
- [Wimpy's NixOS & Home Manager Configurations](<https://github.com/wimpysworld/nix-config/tree/039e2f0151b03b9a3aa2991230a6becf75d91c43>)
- [How to: Use Nix on Ubuntu](<https://tech.aufomm.com/my-nix-journey-use-nix-with-ubuntu/#Install-Nix>)
- [How to: Getting started with Home Manager for Nix](<https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix>)

## TODOs

- [x] Include the auto-venv fish plugin
- [ ] Install 'simple-ass-prompt'
- [ ] Incorporate fish functions
- [x] Git configuration
- [ ] SSH Configuration
- [ ] Install Go
- [ ] Install Rust
- [x] Install Python 3.11 with venv
- [x] Install pipx and some programs (probably I do not need pipx for the apps)
  - [ ] ipython
  - [ ] mu-editor
  - [ ] esptool
- [ ] Try a desktop
