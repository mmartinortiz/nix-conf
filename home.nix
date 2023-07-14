{ ... }: {
	programs = {
home-manager.enable = true;
};

home = {
	packages = with pkgs; [
alejandra
chafa
deadnix
dua
duf
du-dust
nixpkgs-fmt
vim
];

sessionVariables = {
EDITOR = "vim";
SYSTEMD_EDITOR = "vim";
VISUAL = "vim";
};
};
}
