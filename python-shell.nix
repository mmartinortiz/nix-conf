# Nix expression that provides a "fish" shell with the
# specified Python packages. 'buildFHSUserEnv' provides
# access to the system libstdc library required by
# Python packages like iPython or Numpy
#
# Run with 'nix-shell python-shell.nix'
#
{ pkgs ? import <nixpkgs> { } }:
(pkgs.buildFHSUserEnv {
  name = "pipzone";
  targetPkgs = kgs: (with pkgs; [
    python311
    python311Packages.pip
    python311Packages.virtualenv
  ]);
  runScript = "fish";
}).env

