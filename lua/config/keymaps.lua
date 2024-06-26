-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Initialize global var to false -> nvim-cmp turned off per default

-- nvim-cmp toggling; turn it off & map to <leader>ua
vim.g.cmptoggle = false

local cmp = require("cmp")
cmp.setup({
    enabled = function()
        return vim.g.cmptoggle
    end,
})

vim.keymap.set("n", "<leader>ua", function()
    vim.g.cmptoggle = not vim.g.cmptoggle
    print("nvim-cmp " .. (vim.g.cmptoggle and "enabled" or "disabled"))
end, { desc = "Toggle nvim-cmp" })
