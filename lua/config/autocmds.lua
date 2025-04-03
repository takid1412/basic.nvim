vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"/etc/nginx/**.conf"},
  command = "set filetype=nginx"
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nginx",
  callback = function()
    vim.cmd([[
      syntax region ngxLua start=/\(\<content_by_lua\|access_by_lua\|header_filter_by_lua\|body_filter_by_lua\|init_by_lua\|init_worker_by_lua\)\(_block\)* {/ end=/}/ contains=@lua
    ]])
  end
})
