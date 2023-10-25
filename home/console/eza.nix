{...}: {
  programs.eza = {
    enable = true;
    enableAliases = true;
    icons = true;
    git = true;
    extraOptions = [
      "--hyperlink"
      "--group-directories-first"
      "--header"
    ];
  };
}
