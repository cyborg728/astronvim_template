return {
  name = "searxng",
  description = "Search the web via local SearXNG instance",
  cmds = {
    {
      cmd = "curl",
      args = function(input)
        local query = vim.uri_encode(input.query)
        return {
          "-s",
          string.format("https://priv.au/search?q=%s&format=json", query),
        }
      end,
    },
  },
  schema = {
    type = "function",
    ["function"] = {
      name = "searxng",
      description = "Search via SearXNG",
      parameters = {
        type = "object",
        properties = {
          query = { type = "string", description = "Search query" },
        },
        required = { "query" },
      },
    },
  },
  output = {
    success = function(self, result) return result end,
  },
}
