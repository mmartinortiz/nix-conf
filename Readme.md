# My Nix configuration

## Install Nix

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Install Home Manager

```bash
nix run home-manager/master -- init --switch
```

If you are getting below error, please check if FOLDER `~/.local/state/nix/profiles` exists, otherwise create it manually.

```bash
Could not find suitable profile directory, tried /home/<username>/.local/state/home-manager/profiles and /nix/var/nix/profiles/per-user/user
```

## Activate Home Manager

```shell
# From the 'nix-conf' folder
nix run nixpkgs#home-manger -- switch --flake .

# Alternatively

nix run nixpkgs#home-manger -- switch --flake <path_to>/nix-conf
```

```shell
# Check the nix file
nix flake check

# Activate a development environment
nix run . switch # or
nix develop
```
