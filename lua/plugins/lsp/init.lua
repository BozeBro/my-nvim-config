return {
	{
	"neovim/nvim-lspconfig",
	dependencies = {'folke/neodev.nvim'},
},
	{
	'folke/neodev.nvim',
	config = function() require'neodev'.setup() end,
},
{
	"williamboman/mason-lspconfig.nvim",
	dependencies = {"williamboman/mason.nvim"},
	config = function() require("mason-lspconfig").setup() end,
},
{
	'williamboman/mason.nvim',
	config = function() require("mason").setup() end},
}
