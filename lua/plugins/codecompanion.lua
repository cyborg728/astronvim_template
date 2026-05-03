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
          auto_generate_title = false,
          -- title_generation_opts = {
          --   adapter = "gemini_flash",
          --   model = "gemini-2.5-flash-lite",
          -- },
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
              api_key = os.getenv "OLLAMA_API_KEY",
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
              api_key = os.getenv "GEMINI_API_KEY",
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
            -- vim.notify("Looking for: " .. project_md) -- убрать после проверки
            if vim.fn.filereadable(project_md) == 1 then return table.concat(vim.fn.readfile(project_md), "\n") end
            return opts_.default_system_prompt or "test"
          end,
        },
      },
      -- inline = { adapter = "ollama" },
    },
  },
}
