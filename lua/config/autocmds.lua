-- openresty syntax
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


-- UI padding fix
vim.api.nvim_create_autocmd({'UIEnter', 'ColorScheme'}, {
    callback = function()
        local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
        if normal.bg then
            io.write(string.format('\027]11;#%06x\027\\', normal.bg))
        end
    end,
})

vim.api.nvim_create_autocmd('UILeave', {
    callback = function()
        io.write('\027]111\027\\')
    end,
})


-- iptables syntax
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*/iptables/*", "**iptables", "*/ip6tables/*", "*ip6tables*"},
    callback = function() vim.bo.filetype = "iptables" end
})
