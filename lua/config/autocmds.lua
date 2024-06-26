-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- goyo & other options for neomutt emails
vim.api.nvim_create_autocmd("BufRead", {
    pattern = {
        "/tmp/neomutt*",
    },
    --command = "set formatoptions-=t",
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.cmd("Goyo")
        vim.cmd([[
      let g:goyo_width=80
      set bg=dark
      set formatoptions-=t
      set linebreak
      set wrap
      map ZZ :Goyo\|x!<CR>
      map ZQ :Goyo\|q!<CR>
    ]])
    end,
})

-- disable commenting newline
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})
