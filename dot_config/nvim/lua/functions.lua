function noremap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = false })
end

function nnoremap(shortcut, command)
  noremap('n', shortcut, command)
end

function inoremap(shortcut, command)
  noremap('i', shortcut, command)
end

function cnoreabbrev(source, abbrev)
    vim.cmd('cnoreabbrev ' .. source .. ' ' .. abbrev)
end
