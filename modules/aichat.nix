{pkgs, ...}: let
  aichatConfig =
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

  dutchRole =
    #markdown
    ''
      ---
      model: ollama:mistral
      temperature:
      top_p:
      ---
      You are a language assistant. If the input is in Dutch, you review the text and fix errors. If the input is in another language than Dutch, you translate the input to Dutch. Do NOT add any additional information. Reply only with the translated or improved text.

    '';

  englishRole =
    #markdown
    ''
      ---
      model: ollama:mistral
      temperature:
      top_p:
      ---
      You are a language assistant. If the input is in English, you review the text and fix errors. If the input in another language than English, you translate the input to English. Do NOT add any additional information. Reply only with the translated or improved text.
    '';

  commitRole =
    #markdown
    ''
      ---
      model: ollama:llama3
      temperature:
      top_p:
      ---
      Suggest me clean, comprehensive, good commit messages for my commit following conventional commit convention (<type>[optional scope]: <description>). Output results as a list, not more than 6 items. I will send you an output of "git diff --staged" command. Do NOT preface the commit with anything. Do NOT add any descriptions to the commit, only commit message. Use the present tense. Lines must not be longer than 74 characters.
    '';

  commitSuggesterRole =
    #markdown
    ''
      ---
      model: ollama:llama3
      temperature:
      top_p:
      ---
      I want you to act as a commit message generator. Suggest me clean, comprehensive, good commit messages for my commit following conventional commit convention (<type>[optional scope]: <description>). Output results as a list, not more than 6 items. I will provide you with information about the task and the prefix for the task code, and I would like you to generate an appropriate commit message using the conventional commit format. Do not write any explanations or other words, just reply with the commit message.
    '';
in {
  home.packages = with pkgs; [
    aichat
    ollama
  ];

  xdg.configFile."aichat/config.yaml".text = aichatConfig;

  # Roles
  xdg.configFile."aichat/roles/dutch.md".text = dutchRole;
  xdg.configFile."aichat/roles/english.md".text = englishRole;
  xdg.configFile."aichat/roles/commit.md".text = commitRole;
  xdg.configFile."aichat/roles/commitSuggester.md".text = commitSuggesterRole;

  programs.fish = {
    interactiveShellInit =
      #fish
      ''
        # [c]ommit [m]essage
        abbr --add cm "git diff --staged | aichat --role commit"
        # [c]ommit [s]uggester
        abbr --add cs --set-cursor "aichat --role commitSuggester \"%\""
      '';
  };
}
