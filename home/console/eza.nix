{...}: {
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = true;
    git = true;
    extraOptions = [
      "--hyperlink"
      "--group-directories-first"
      "--header"
    ];
  };
}
