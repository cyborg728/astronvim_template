return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
  },
  opts = {
    extensions = {
      history = {
        enabled = true,
        opts = {
          keymap = "gh",
          auto_save = true,
        },
      },
    },
    log_level = "DEBUG",
    adapters = {
      http = {
        ollama_api = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              -- url = "http://127.0.0.1:11434",
              url = "https://ollama.com",
              api_key = "1175abe8a1e24ac0baaf25e4614053e9.9MEZXfceh3mEG8cc7YZ0s-am",
            },
            headers = {
              ["Authorization"] = "Bearer ${api_key}",
              ["Content-Type"] = "application/json",
            },
            schema = {
              model = {
                default = "glm-5.1:cloud",
              },
              -- num_ctx = {
              --   default = 16384,
              -- },
            },
          })
        end,
        gemini_flash = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "AIzaSyDF2pXm8uGEf0gVf_nPLtfF0Qx0YBVRJYY",
            },
            schema = {
              model = {
                default = "gemini-3.1-flash-lite-preview",
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = "ollama_api",
        opts = {
          system_prompt = function(opts_)
            local project_md = vim.fn.getcwd() .. "/.codecompanion.md"
            if vim.fn.filereadable(project_md) == 1 then return table.concat(vim.fn.readfile(project_md), "\n") end
            return opts_.default_system_prompt or "test"
          end,
        },
      },
      -- inline = { adapter = "ollama" },
    },
  },
}
