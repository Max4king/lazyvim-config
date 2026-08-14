return {
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
        -- nes = {
        --   enabled = false,
        --   keymap = {
        --     accept_and_goto = "<leader>p",
        --     accept = false,
        --     dismiss = "<Esc>",
        --   },
        --   move_count_threshold = 3,
        -- },
        suggestion = {
          auto_trigger = true,
        },
        filetypes = {
          go = true,
          rust = false,
          lua = true,
          python = true,
          typescript = true,
          typescriptreact = true,
          ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
        },
      })
    end,
  },
}
