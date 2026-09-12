vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.copyindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.linebreak = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.keymap = "dvorak"
vim.opt.scrolloff = 9
vim.opt.modeline = true;

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.backspace = { "indent", "eol", "start" }

-- Commands only for specific file types.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown" },
  callback = function()
    vim.opt_local.textwidth = 79
    -- vim.opt_local.spell = true
    -- vim.opt_local.spelllang = { "en", "es" }
  end,
})

-- Key commands.
vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "j", "gj")
map("n", "k", "gk")
map("n", "gj", "j")
map("n", "gk", "k")

map("n", "H", "h")
map("n", "J", "j")
map("n", "K", "k")
map("n", "L", "l")

-- Use Alt hjkl to move between panels.
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- Use alt backspace to delete previous word. (like in macos)
-- Control w is awful.
map("i", "<A-H>", "<C-w>")
map("i", "<A-BS>", "<C-w>")
-- Delete the whole line with super (cmd) backspace
map("i", "<D-H>", "<C-u>")
map("i", "<D-BS>", "<C-u>")
-- map("i", "<C-?>", "<C-w>")
map("i", "<C-Space>", "<C-x><C-p>")
map("i", "<C-@>", "<C-x><C-p>")

-- Use gn and gN to move between files.
map("n", "<Leader>n", ":bnext<CR>")
map("n", "<Leader>N", ":bprevious<CR>")

map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>w", ":w<CR>")

map("n", "<Leader>t", ":split | term<CR>")
map("n", "<Leader>T", ":vsplit | term<CR>")

map("n", "<Leader>s", ":%s/<C-r><C-w>//gc<Left><Left><Left>")

map("t", "<Esc>", [[<C-\><C-n>]])

-- vim.cmd.colorscheme("catppuccin")

-- local cscope_vimrc = vim.env.HOME .. "/.vimrc.cscope"
-- if vim.fn.filereadable(cscope_vimrc) == 1 then
--   vim.cmd.source(vim.fn.fnameescape(cscope_vimrc))
-- end

require("config.lazy")
-- Plugins.
-- Plug("junegunn/fzf", { ["do"] = vim.fn["fzf#install"] })
-- Plug("junegunn/fzf.vim")
-- Plug("dhananjaylatkar/cscope_maps.nvim")

-- FZF config.
map({ "n", "v", "s", "o" }, "ff", ":Files", { remap = true })

if vim.env.WSL_DISTRO_NAME ~= nil then
  -- For use with WSL. Remove if using somewhere else.
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
else
  -- For use with kitty.
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
    cache_enabled = 0,
  }
end

vim.opt.clipboard:append("unnamedplus")
