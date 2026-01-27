return {
    "habamax/vim-godot",
    config = function ()
        vim.keymap.set('n', '<leader>gr', '<cmd>:GodotRun<CR>')
    end
}
