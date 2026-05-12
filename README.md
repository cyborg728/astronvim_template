# How to exclude files from search "<leader>ff"

- install fd

- add .fdignore (same .gitignore syntax) into project folder for extend hide files in skacks.picker (<leader>ff)

# Codecompanion plugin
.codecompanion.md file inside project folder store system prompt.

# Codecompanion skills
```sh
:CodeCompanionActions
```
or inside chat buffer 
```text
/global: name
```

# Codecompanion check system prompt
```vim
:lua local sp = require("codecompanion.config").interactions.chat.opts.system_prompt; if type(sp) == "function" then print(sp({})) else print(sp) end
```

# AstroNvim Template

**NOTE:** This is for AstroNvim v6+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```
