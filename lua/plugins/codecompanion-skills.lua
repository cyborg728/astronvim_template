return {
  "olimorris/codecompanion.nvim",
  opts = function(_, opts)
    local function load_skills_from(dir, prefix)
      local skills = {}
      if vim.fn.isdirectory(dir) == 0 then return skills end
      for _, file in ipairs(vim.fn.glob(dir .. "/*.md", false, true)) do
        local name = vim.fn.fnamemodify(file, ":t:r")
        local content = table.concat(vim.fn.readfile(file), "\n")
        local label = prefix and (prefix .. ": " .. name) or name
        skills[label] = {
          strategy = "chat",
          description = "Skill from " .. dir,
          prompts = { { role = "system", content = content } },
        }
      end
      return skills
    end

    -- opts.system_prompt = function(opts_)
    --   -- читаем .codecompanion.md из cwd, если есть
    --   local project_md = vim.fn.getcwd() .. "/.codecompanion.md"
    --   if vim.fn.filereadable(project_md) == 1 then return table.concat(vim.fn.readfile(project_md), "\n") end
    --   -- fallback на дефолт
    --   return opts_.language and ("Default prompt in " .. opts_.language) or ""
    -- end

    opts.prompt_library = vim.tbl_extend(
      "force",
      opts.prompt_library or {},
      load_skills_from(vim.fn.expand "~/.config/nvim/codecompanion-skills", "global"),
      load_skills_from(vim.fn.getcwd() .. "/.skills", "project")
    )
    return opts
  end,
}
