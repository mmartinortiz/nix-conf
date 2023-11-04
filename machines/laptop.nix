{pkgs, ...}: {
  # Laptop specific configuration
  home.packages = with pkgs; [
    fortune
  ];
}
