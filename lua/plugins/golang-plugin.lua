return {
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        require("neotest-golang")({
          testify_enabled = true,
          go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
          dap_go_enabled = true,
        }),
      },
    },
    -- opts = function(_, opts)
    --   opts.adapters = opts.adapters or {}
    --
    --   local neotest_golang = require("neotest-golang")({
    --     testify_enabled = true,
    --     go_test_args = { "-v", "-race", "-count=1", "-timeout=30s" },
    --   })
    --
    --   table.insert(opts.adapters, neotest_golang)
    -- end,
  },

  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("coverage").setup({
        lang = {
          go = {
            -- coverage_file = "coverage.out",
            coverage_file = vim.fn.getcwd() .. "/coverage.out",
          },
        },
      })
    end,
    keys = {
      {
        "<leader>tc",
        function()
          require("coverage").toggle()
        end,
        desc = "Toggle Coverage",
      },
      {
        "<leader>tC",
        function()
          require("coverage").clear()
        end,
        desc = "Clear Coverage",
      },
    },
  },

  -- {
  -- --   "nvim-lua/plenary.nvim",
  --   ft = "go",
  --   keys = {
  --     {
  --       "<leader>gm",
  --       function()
  --         vim.cmd("silent! !go generate ./...")
  --         vim.notify("Mocks generated", vim.log.levels.INFO)
  --       end,
  --       desc = "Generate All Mocks",
  --     },
  --     {
  --       "<leader>gM",
  --       function()
  --         vim.cmd("silent! !go generate " .. vim.fn.expand("%:p"))
  --         vim.notify("Mock generated for current file", vim.log.levels.INFO)
  --       end,
  --       desc = "Generate Mock (current file)",
  --     },
  --   },
  -- },
}
