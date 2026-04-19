return {
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          mouse = "",
          -- fixeol = false,
          list = true,
          exrc = true,
          secure = true,
          listchars = {
            eol = "¬",
          },
        },
      }, -- ADD THIS SECTION BELOW:
      mappings = {
        n = { -- Normal mode mappings
          ["<up>"] = { "<nop>", desc = "Disable Up Arrow" },
          ["<down>"] = { "<nop>", desc = "Disable Down Arrow" },
          ["<left>"] = { "<nop>", desc = "Disable Left Arrow" },
          ["<right>"] = { "<nop>", desc = "Disable Right Arrow" },
        },
        i = { -- Insert mode mappings
          ["<up>"] = { "<nop>" },
          ["<down>"] = { "<nop>" },
          ["<left>"] = { "<nop>" },
          ["<right>"] = { "<nop>" },
        },
        v = { -- Visual mode mappings
          ["<up>"] = { "<nop>" },
          ["<down>"] = { "<nop>" },
          ["<left>"] = { "<nop>" },
          ["<right>"] = { "<nop>" },
        },
      },
    },
  },
  {
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
                api_key = "6a3adf6b3d2e406d8271bd5a4f254bc7.RVZN-B_C2f5hAhq1ZM9ucMDA",
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
                api_key = "AIzaSyBc6A_qecC_kRdnws5vs13LYLBujOkRumY",
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
        chat = { adapter = "gemini_flash" },
        -- inline = { adapter = "ollama" },
      },
    },
  },
}
