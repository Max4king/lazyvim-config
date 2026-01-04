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
    "zbirenbaum/copilot.lua",
    --   dependencies = {
    --     "copilotlsp-nvim/copilot-lsp",
    --   },
    --   requires = {
    --     "copilotlsp-nvim/copilot-lsp",
    --     init = function()
    --       vim.g.copilot_nes_debounce = 500
    --     end,
    --   },
    --   cmd = "Copilot",
    --   event = "InsertEnter",
    config = function()
      require("copilot").setup({
        -- nes = {
        --   enabled = true,
        --   keymap = {
        --     accept_and_goto = "<leader>p",
        --     accept = false,
        --     dismiss = "<Esc>",
        --   },
        -- },
        suggestion = {
          auto_trigger = true,
        },
        filetypes = {
          golang = true,
          rust = true,
          python = true,
          ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
        },
      })
    end,
  },
  {},
}
