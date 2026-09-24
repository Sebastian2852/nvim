local PACKAGES = {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/neovim/nvim-lspconfig",

    -- "https://github.com/blazkowolf/gruber-darker.nvim",
    -- "https://github.com/folke/tokyonight.nvim",
    "https://github.com/EdenEast/nightfox.nvim",
}

local KEYMAP = {
    {{'n'}, "<leader>cd", "<cmd>Ex<cr>"},
    {{'t'}, "<Esc>", "<C-\\><C-n>"},

    {{'n'}, "<leader>sr", "<cmd>vsplit<cr><C-w>l"},
    {{'n'}, "<leader>sb", "<cmd>split<cr><C-w>j"},

    {{'n'}, "<leader>wl", "<C-w>l"},
    {{'n'}, "<leader>wh", "<C-w>h"},
    {{'n'}, "<leader>wk", "<C-w>k"},
    {{'n'}, "<leader>wj", "<C-w>j"},
}

vim.pack.add(PACKAGES)

vim.g.mapleader = ' '
vim.g.maplocalleader = " "

for _, v in pairs(KEYMAP) do
    local key = v[2]
    local action = v[3]

    for _, mode in pairs(v[1]) do
        vim.keymap.set(mode, key, action)
    end
end

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = true
vim.opt.listchars = {
    space = "·",
    tab = "→ ",
    nbsp = "␣",
}

vim.opt.fillchars = {
  eob = " ",
}

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

require('nvim-treesitter').install { "lua", "c" }

--[[
require("gruber-darker").setup({
    italic = {
        strings = false,
    },
})
]]--
-- vim.cmd.colorscheme("gruber-darker")
-- vim.cmd.colorscheme("tokyonight")
vim.cmd.colorscheme("carbonfox")

vim.lsp.enable("clangd")
