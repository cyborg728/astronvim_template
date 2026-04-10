return {
  "olimorris/codecompanion.nvim",
  opts = {
    adapters = {
      http = {
        vastai = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "vastai",
            env = {
              url = os.getenv("VASTAI_URL") or "http://localhost:11434",
            },
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer " .. (os.getenv("VASTAI_TOKEN") or ""),
            },
            schema = {
              model = {
                default = os.getenv("VASTAI_MODEL") or "qwen3-coder-next:latest",
                choices = false,
              },
              num_ctx = {
                default = 32768,
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = "vastai",
      },
      inline = {
        adapter = "vastai",
      },
    },
    mcp = {
      servers = {
        filesystem = {
          command = "uvx",
          args = { "mcp-server-filesystem", vim.fn.getcwd() },
        },
      },
    },
  },
}
