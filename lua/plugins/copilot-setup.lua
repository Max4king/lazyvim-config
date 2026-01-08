return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  },
  {
    "copilotlsp-nvim/copilot-lsp",
  },
  {
    "zbirenbaum/copilot.lua",
    requires = {
      "copilotlsp-nvim/copilot-lsp",
      init = function()
        vim.g.copilot_nes_debounce = 500
      end,
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        nes = {
          enabled = true,
          keymap = {
            accept_and_goto = "<leader>p",
            accept = false,
            dismiss = "<Esc>",
          },
          move_count_threshold = 3,
        },
        suggestion = {
          auto_trigger = true,
        },
        filetypes = {
          go = true,
          rust = true,
          lua = true,
          python = true,
          ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
        },
      })
    end,
  },
}
