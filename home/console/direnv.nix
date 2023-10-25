{...}: {
  programs.direnv = {
    # Note, enabling the direnv module will always active its functionality for Fish
    # since the direnv package automatically gets loaded in Fish
    enable = true;
    enableBashIntegration = true;
    nix-direnv = {
      enable = true;
    };
  };
}
