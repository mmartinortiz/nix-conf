{...}: {
  programs.nixvim = {
    keymaps = [
      # ToggleTerm
      {
        key = "<leader>tf";
        action = "<cmd>ToggleTerm direction=float<cr>";
        mode = "n";
        options = {
          desc = "ToggleTerm float";
          silent = true;
        };
      }
      {
        key = "<leader>th";
        action = "<cmd>ToggleTerm size=10 direction=horizontal<cr>";
        mode = "n";
        options = {
          silent = true;
          desc = "ToggleTerm horizontal split";
        };
      }

      {
        key = "<leader>tv";
        action = "<cmd>ToggleTerm size=80 direction=vertical<cr>";
        mode = "n";
        options = {
          silent = true;
          desc = "ToggleTerm vertical split";
        };
      }
      {
        key = "<c-\\>";
        action = "<cmd>ToggleTerm<cr>";
        mode = "n";
        options = {
          silent = true;
          desc = "Toggle terminal";
        };
      }

      # Comment
      # Neovim seems to register <C-/> as <C-_>
      {
        key = "<c-_>";
        mode = "n";
        action = "<Plug>(comment_toggle_linewise_current)";
        options = {
          desc = "Comment line";
        };
      }
      # Neovim seems to register <C-/> as <C-_>
      {
        key = "<C-_>";
        action = "<Plug>(comment_toggle_linewise_visual)";
        mode = "v";
        options = {
          desc = "Comment line/block";
        };
      }

      # NeoTree
      {
        key = "<C-b>";
        mode = "n";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          desc = "Toggle Neotree visibility";
        };
      }
    ];
  };
}
