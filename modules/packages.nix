{pkgs, ...}: {
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    alejandra # Nix formatter
    chafa # Terminal image viewer
    devbox # Create isolated shells for development
    devcontainer # A reference implementation for the specification
    diffr # Modern Unix `diff`
    du-dust # A more intuitive version of du in rust
    dua # Modern Unix `du`
    duf # Modern Unix `df`
    fd # Modern Unix `find`
    glow # Terminal Markdown renderer
    gping # Modern Unix `ping`
    grc # Colour terminal output
    procs # Modern Unix `ps`
    ripgrep # Modern Unix `grep`
    tldr # Modern Unix `man`
    uv # Replacement for pip written in Rust
    wget2 # The successor of GNU Wget
    # (pkgs.nerdfonts.override {fonts = ["Hack" "UbuntuMono" "FiraCode"];})
    nerd-fonts.hack
    nerd-fonts.ubuntu-mono
    nerd-fonts.fira-code
  ];
}
