{
  config,
  pkgs,
  lib,
  ...
}: {
  home.username = "manolo";
  home.homeDirectory = "/var/home/manolo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    aichat
  ];

  xdg.configFile."aichat/config.yaml".text =
    #yaml
    ''
      model: ollama
      clients:
      - type: openai-compatible
        name: ollama
        api_base: http://localhost:11434/v1
        api_key: null
        models:
        - name: llama3
          max_input_tokens: null
        - name: mistral
          max_input_tokens: null
    '';
}
