if vim.g.started_by_firenvim == true then
  vim.o.laststatus = 0
  vim.cmd('ALEDisable')
else
  vim.o.laststatus = 2
end
