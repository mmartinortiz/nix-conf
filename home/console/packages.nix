{pkgs, ...}: {
    home.packages = with pkgs; [
      alejandra # Format Nix files
      chafa # Terminal image viewer
      deadnix
      diffr # Modern Unix `diff`
      du-dust
      dua # Modern Unix `du`
      duf # Modern Unix `df`
      fd # Modern Unix `find`
      glow # Terminal Markdown renderer
      gping # Modern Unix `ping`
      grc # Colour terminal output
      procs # Modern Unix `ps`
      ripgrep # Modern Unix `grep`
      tldr # Modern Unix `man`
      wget2
      (pkgs.nerdfonts.override {fonts = ["Hack" "UbuntuMono" "FiraCode"];})
    ];
}
