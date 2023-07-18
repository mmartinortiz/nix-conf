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

## Other people's Nix config

- [Wimpy's NixOS & Home Manager Configurations](<https://github.com/wimpysworld/nix-config/tree/039e2f0151b03b9a3aa2991230a6becf75d91c43>)
