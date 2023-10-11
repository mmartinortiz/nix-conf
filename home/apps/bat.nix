{pkgs, ...} : {
    programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batwatch
        prettybat
      ];
    };
}
