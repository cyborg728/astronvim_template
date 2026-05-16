return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
  },
  itin = {
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "codecompanion",
      callback = function() vim.wo.winfixbuf = true end,
    }),
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
                choices = {
                  "glm-5.1:cloud",
                  "deepseek-v4-pro:cloud",
                  "gemma4:31b-cloud",
                },
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
        -- https://codecompanion.olimorris.dev/configuration/prompt-library#adding-prompts
        -- https://codecompanion.olimorris.dev/configuration/rules
        -- https://codecompanion.olimorris.dev/configuration/system-prompt
        -- opts = {
        --   system_prompt = function(opts_)
        --     local project_md = vim.fn.getcwd() .. "/.codecompanion.md"
        --     -- vim.notify("Looking for: " .. project_md) -- убрать после проверки
        --     if vim.fn.filereadable(project_md) == 1 then return table.concat(vim.fn.readfile(project_md), "\n") end
        --     return opts_.default_system_prompt or "test"
        --   end,
        -- },
        tools = {
          searxng = {
            path = "tools.searxg",
            deasription = "Search via SearXNG",
          },
        },
      },
      -- inline = { adapter = "ollama" },
    },
  },
}
