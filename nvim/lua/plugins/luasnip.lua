require("luasnip.loaders.from_lua")
    .load({paths = vim.fn.stdpath('config').."/lua/luasnip/"})

local ls = require("luasnip")
ls.config.set_config({
    enable_autosnippets = true,
})

vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
