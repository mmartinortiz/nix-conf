{...}: {
  programs.nixvim = {
    plugins.barbar = {
      enable = true;
      animation = true;
      keymaps = {
        # Reordering tabs
        moveNext = "<m-s-k>";
        movePrevious = "<m-s-j>";
        pin = "<m-p>";

        # Navigating tabs
        next = "<m-k>";
        previous = "<m-j>";
        goTo1 = "<m-1>";
        goTo2 = "<m-2>";
        goTo3 = "<m-3>";
        goTo4 = "<m-4>";
        goTo5 = "<m-5>";
        goTo6 = "<m-6>";
        goTo7 = "<m-7>";
        goTo8 = "<m-8>";
        goTo9 = "<m-9>";
        last = "<m-0>";

        # Close tab
        close = "<m-x>";
      };
    };
  };
}
