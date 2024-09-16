-- ****************************************************************************
-- Plugins
-- ****************************************************************************

require('plugins')
require('functions')

local vimp = require('vimp')

-- require("hardtime").setup()
require("mini.comment").setup()
require('mini.cursorword').setup()
require('mini.starter').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()
require('mini.ai').setup()
require('mini.bracketed').setup()
-- require('mini.indentscope').setup()

-- ****************************************************************************
-- Basic settings
-- ****************************************************************************

-- better-defaults
vim.cmd('runtime! plugin/default.vim')

vim.g.mapleader = " "

vim.opt.cindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vimp.always_override = true

vim.g.EasyMotion_startofline = 0 -- keep cursor column when JK motion
vim.g.EasyMotion_smartcase = 1

-- Session management
vim.g.session_directory = vim.fn.stdpath('config') .. '/session'
vim.g.session_autoload = 'no'
vim.g.session_autosave = 'no'
vim.g.session_command_aliases = 1

-- ****************************************************************************
-- Visual settings
-- ****************************************************************************

vim.cmd.colorscheme('gruvbox')
vim.opt.termguicolors = true

-- gui & mouse settings
vim.cmd('set mousemodel=popup')
vim.cmd('set t_Co=256')
vim.cmd('set guioptions=egmrti')

-- cursor settings
vim.cmd('set guicursor+=n:hor20-Cursor/lCursor')

vim.o.modelines = 10
vim.o.title = true
vim.o.titleold = 'Terminal'

-- TODO: fixup
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"*.py", "*.c", "*.h", "*.lua"},
  callback = function(ev)
    vim.fn['rainbow#activate']()
  end
})

-- ****************************************************************************
-- Search
-- ****************************************************************************

-- ****************************************************************************
-- Mappings
-- ****************************************************************************

-- Movement keys

vimp.nnoremap('#', '$')
vimp.nnoremap('0', '#')
vimp.nnoremap('$', '0')

vimp.nnoremap('gl', '$')
vimp.nnoremap('gh', '0')
vimp.nnoremap('mm', '%')

vimp.nnoremap('<C-j>', '<C-e>')
vimp.nnoremap('<C-k>', '<C-y>')

vimp.nnoremap({'silent'}, '<leader>,', ':noh<cr>')

vimp.noremap('YY', '"+y<CR>')
vimp.noremap('<leader><leader>p', '"+gP<CR>')
vimp.noremap('XX', '"+x<CR>')

-- Vmap for maintain Visual Mode after shifting > and <
vimp.vmap('<', '<gv')
vimp.vmap('>', '>gv')

-- Move visual block
vimp.vnoremap('J', ':m \'>+1<cr>gv=gv')
vimp.vnoremap('K', ':m \'<-2<cr>gv=gv')

-- easymotion
vimp.map('<Leader>fc', '<Plug>(easymotion-bd-f)')
vimp.nmap('<Leader>fc', '<Plug>(easymotion-overwin-f)')

vim.cmd('nmap <Leader>s <Plug>(easymotion-overwin-f2)')
vim.cmd('nnoremap s <Plug>(easymotion-s2)')
vim.cmd('nmap t <Plug>(easymotion-t2)')
vim.cmd('map <leader>l <Plug>(easymotion-bd-jk)')
vim.cmd('nmap <Leader>L <Plug>(easymotion-overwin-line)')
vim.cmd('map <Leader>wm <Plug>(easymotion-bd-w)')
vim.cmd('nmap <Leader>wm <Plug>(easymotion-overwin-w)')

vimp.map('<leader>/', '<Plug>(easymotion-sn)')
vimp.omap('<leader>/', '<Plug>(easymotion-tn)')
vimp.map('<A-n>', '<Plug>(easymotion-next)')
vimp.map('<A-N>', '<Plug>(easymotion-prev)')

vimp.map('<Leader>l', '<Plug>(easymotion-lineforward)')
vimp.map('<Leader>j', '<Plug>(easymotion-j)')
vimp.map('<Leader>k', '<Plug>(easymotion-k)')
vimp.map('<Leader>h', '<Plug>(easymotion-linebackward)')

-- Session management

vimp.nnoremap('<leader>So', ':OpenSession<Space>')
vimp.nnoremap('<leader>Ss', ':SaveSession<Space>')
vimp.nnoremap('<leader>Sd', ':DeleteSession<CR>')
vimp.nnoremap('<leader>Sc', ':CloseSession<CR>')

-- Buffer management

vimp.nnoremap('<leader>bp', ':bp<CR>')
vimp.nnoremap('<leader>bn', ':bn<CR>')
vimp.nnoremap('<leader>bb', ':Buffers<CR>')

-- Search

vimp.nnoremap('n', 'nzzzv')
vimp.nnoremap('N', 'Nzzzv')

vimp.nnoremap('<leader>ff', ':Files<CR>')
vimp.nnoremap('<leader>fg', ':Ag<CR>')
vimp.nnoremap('<leader>fG', ':Rg<CR>')

-- Save modified buffer
vimp.nnoremap('<Leader>fs', function()
    if vim.o.modified == true then
        vim.cmd(':w')
    end
end)

vimp.nnoremap('<Leader>q', ':q<CR>')
vimp.nnoremap('<Leader>Q', ':qall<CR>')

-- Reload init.lua
vimp.nnoremap('<leader>rr', function()
  vimp.unmap_all()
  -- it will reload the file
  -- require("config.util").unload_lua_namespace('config')
  vim.cmd('silent wa')
  dofile(vim.fn.stdpath('config') .. '/init.lua')

  print("Reloaded init.lua!")
end)

vimp.nnoremap({'silent'}, '<leader>sh', ':terminal<CR>')

vimp.nnoremap('<leader>at', ':ALEToggle<CR>')

-- Abbreviations

cnoreabbrev('W!', 'w!')
cnoreabbrev('Q!', 'q!')
cnoreabbrev('Qall!', 'qall!')
cnoreabbrev('Wq', 'wq')
cnoreabbrev('Wa', 'wa')
cnoreabbrev('wQ', 'wq')
cnoreabbrev('WQ', 'wq')
cnoreabbrev('W', 'w')
cnoreabbrev('Q', 'q')
cnoreabbrev('Qall', 'qall')

-- Split
vimp.noremap('<Leader>ws', ':<C-u>split<CR>')
vimp.noremap('<Leader>wv', ':<C-u>vsplit<CR>')
vimp.noremap('<Leader>wd', ':close<CR>')

-- Switching windows
vimp.noremap('<leader>wj', '<C-w>j')
vimp.noremap('<leader>wk', '<C-w>k')
vimp.noremap('<leader>wl', '<C-w>l')
vimp.noremap('<leader>wh', '<C-w>h')
vimp.nnoremap({'silent'}, '<leader><leader>ww', ':call WindowSwap#EasyWindowSwap()<CR>')

-- Switching buffers

vimp.noremap('<leader>bd', ':bd<CR>')

-- Vim wiki

vimp.nnoremap({'silent'}, '<leader>vw', ':VimwikiIndex<CR>')
-- vim.api.nvim_del_keymap('n', '<leader>wt')
vimp.nnoremap({'silent'}, '<leader>vtl', ':VimwikiToggleListItem<CR>')

-- Git
vimp.noremap('<Leader>ga', ':Gwrite<CR>')
vimp.noremap('<Leader>gc', ':Git commit --verbose<CR>')
vimp.noremap('<Leader>gp', ':Git push<CR>')
vimp.noremap('<Leader>gl', ':Git pull<CR>')
vimp.noremap('<Leader>gs', ':Git<CR>')
vimp.noremap('<Leader>gb', ':Git blame<CR>')
vimp.noremap('<Leader>gd', ':Gvdiffsplit<CR>')
vimp.noremap('<Leader>gr', ':GRemove<CR>')
vimp.nnoremap('<Leader>o', ':.GBrowse<CR>')

vim.g.gitgutter_map_keys = 0

-- Tabs

vim.cmd('nnoremap <Tab> gt')
vimp.nnoremap('<S-Tab>', 'gT')
vimp.nnoremap({'silent'}, '<S-t>', ':tabnew<CR>')

-- Set working directory
vimp.nnoremap('<leader>.', ':lcd %:p:h<CR>')

-- Opens an edit command with the path of the currently edited file filled in
vimp.noremap('<Leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>')

-- Opens a tab edit command with the path of the currently edited file filled
vimp.noremap('<Leader>te', ':tabe <C-R>=expand("%:p:h") . "/" <CR>')

vimp.nmap({'silent'}, '<Leader>d', '<Plug>(doge-generate)')

-- NERDTree

vimp.nnoremap({'silent'}, '<leader>nf', ':NERDTreeFind<CR>')
vimp.nnoremap({'silent'}, '<leader>nt', ':NERDTreeToggle<CR>')

-- ****************************************************************************
-- Commands
-- ****************************************************************************

vim.api.nvim_create_user_command('FixWhitespace', [[:%s/\s\+$//e]], {})

-- ****************************************************************************
-- Functions
-- ****************************************************************************

function setup_wrapping()
  vim.o.wrap = true
  vim.o.wm = 2
  vim.o.textwidth = 100
end

setup_wrapping()

-- ****************************************************************************
-- Autocmd Rules
-- ****************************************************************************

vim.cmd([[
  augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
  augroup END
]])

vim.cmd([[
  augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup END
]])

vim.cmd([[
  augroup vimrc-wrapping
    autocmd!
    autocmd BufRead,BufNewFile *.txt lua setup_wrapping()
  augroup END
]])

vim.cmd([[
  augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
  augroup END
]])

-- Filetype-specific

vim.cmd('autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab')
vim.cmd('autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab')

vim.cmd([[
  augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=120
        \ formatoptions+=croq softtabstop=4
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
  augroup END
]])

-- ****************************************************************************
-- Plugin-specific config
-- ****************************************************************************

-- nvim-treesitter config

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    enable = true,

    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    additional_vim_regex_highlighting = false,
  },
}

-- ALE

vim.g.ale_disable_lsp = 1
vim.cmd([[
  let g:ale_linters = {
  \   'c': ['clangd'],
  \   'python': ['pycodestyle'],
  \}
]])

----------------- coc.nvim ----------------------

vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

----------------- NERDTree ----------------------

vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeIgnore = { "node_modules",".rbc$", "~$", ".pyc$", ".db$", ".sqlite$", "__pycache__" }
vim.g.NERDTreeSortOrder = { '^__.py$', '/$', '*', '.swp$', '.bak$', '~$' }
vim.g.NERDTreeShowBookmarks = 1
vim.g.nerdtree_tabs_focus_on_files = 1
vim.g.NERDTreeMapOpenInTabSilent  =  '<RightMouse>'
vim.g.NERDTreeWinSize = 50

vim.o.wildignore = vim.o.wildignore .. "*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/"

----------------- UltiSnips ----------------------

vim.g.UltiSnipsExpandTrigger = "<tab>"

----------------- VimWiki ----------------------

vim.cmd([[
    let g:vimwiki_list = [{'path': '~/Documents/Parlis/hc/', 'syntax': 'markdown', 'ext': '.md'}]
]])


