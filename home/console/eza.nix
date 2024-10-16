{...}: {
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
    git = true;
    extraOptions = [
      "--hyperlink"
      "--group-directories-first"
      "--header"
    ];
  };
}
