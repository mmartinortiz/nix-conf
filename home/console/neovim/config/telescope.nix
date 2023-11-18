{pkgs, ...}: {
  programs.nixvim = {
    plugins.telescope.enable = true;

    plugins.telescope.enabledExtensions = ["ui-select"];
    plugins.telescope.extensionConfig.ui-select = {};

    plugins.telescope.extensions.frecency.enable = true;
    plugins.telescope.extensions.fzf-native.enable = true;
    #plugins.telescope.extensions.media_files.enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      telescope-ui-select-nvim
    ];

    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
      }
      {
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
      }
      {
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<cr>";
      }
      {
        key = "<leader>fk";
        action = "<cmd>Telescope keymaps<cr>";
      }
      {
        key = "<leader>fp";
        action = "<cmd>Telescope commands<cr>";
      }
    ];
  };
}
