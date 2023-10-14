{...}: {
  programs.eza = {
    enable = true;
    icons = true;
    git = true;
    extraOptions = [
      "--hyperlink"
      "--group-directories-first"
      "--header"
    ];
  };
}
