vim.cmd([[command! PUnit :lua require"phpunit".run_tests()]])

-- Just for my own testing. Users can choose teir own mapping
--vim.api.nvim_set_keymap("n", "<leader>pu", "<cmd>PUnit<CR>", {})
