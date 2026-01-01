return {
  -- 1. Keep nvim-lint
  "mfussenegger/nvim-lint",

  -- 2. Configure Conform
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
      },
    },
  },

  -- 3. Load neotest-golang (Do NOT add opts here)
  {
    "fredrikaverpil/neotest-golang",
    -- dependencies = { "leoluz/nvim-dap-go" }, -- Recommended if you want debugging
  },

  -- 4. Configure neotest to use the adapter
  {
    "nvim-neotest/neotest",
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}

      -- Manually initialize the adapter with your configuration
      local neotest_golang = require("neotest-golang")({
        testify_enabled = true,
        -- Add other neotest-golang options here if needed, e.g.:
        -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
      })

      -- Add it to the neotest adapters list
      table.insert(opts.adapters, neotest_golang)
    end,
  },
}
