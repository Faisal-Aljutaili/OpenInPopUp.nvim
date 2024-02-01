# OpenInPopUp.nvim

#usage 
```
--with lazy vim
{
    "Faisal-Aljutaili/OpenInPopUp.nvim",
    init = function()
      vim.api.nvim_set_keymap(
        "n",
        "<Leader>go",
        '<cmd>lua require("OpenInPopUp").new{}:open("lazygit", { width = 200, height = 150 })<cr>',
        { noremap = true, silent = true }
      )
    end,
  }
```
*if you want to enter the command manually you can use:*
```
{
    "Faisal-Aljutaili/OpenInPopUp.nvim",
    init = function()
      vim.api.nvim_set_keymap(
        "n",
        "<Leader>go",
        '<cmd>lua require("OpenInPopUp").new{}:open(vim.fn.input("lazygit"), { width = 200, height = 150 })<cr>',
        { noremap = true, silent = true }
      )
    end,
  },
```
