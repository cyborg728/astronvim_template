return {
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
}
