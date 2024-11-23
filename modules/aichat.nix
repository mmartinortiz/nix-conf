{pkgs, ...}: {
  home.packages = with pkgs; [
    aichat
  ];
  # Configuration example to be saved in ~/.config/aichat/config.yamle
  # Itepends on the AI model to be used
  # see https://github.com/sigoden/aichat/blob/main/config.example.yaml

  # model: ollama
  # clients:
  # - type: openai-compatible
  #   name: ollama
  #   api_base: http://localhost:11434/v1
  #   api_key: null
  #   models:
  #   - name: llama3
  #     max_input_tokens: null
}
