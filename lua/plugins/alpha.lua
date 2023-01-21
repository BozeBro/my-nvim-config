return {
	{"goolord/alpha-nvim",

	config = function(_, _)
		local alpha = require 'alpha'
		--alpha.setup(require'alpha.themes.dashboard'.config)
		local dashboard = require 'alpha.themes.dashboard'
		dashboard.section.header.val =  {
"██████╗░███████╗███╗░░██╗███████╗██████╗░██╗░█████╗░████████╗",
"██╔══██╗██╔════╝████╗░██║██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝",
"██████╦╝█████╗░░██╔██╗██║█████╗░░██║░░██║██║██║░░╚═╝░░░██║░░░",
"██╔══██╗██╔══╝░░██║╚████║██╔══╝░░██║░░██║██║██║░░██╗░░░██║░░░",
"██████╦╝███████╗██║░╚███║███████╗██████╔╝██║╚█████╔╝░░░██║░░░",
"╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═════╝░╚═╝░╚════╝░░░░╚═╝░░░",
" ",
"              ░█████╗░███████╗██╗░░░██╗░█████╗░",
"              ██╔══██╗╚════██║██║░░░██║██╔══██╗",
"              ██║░░██║░░███╔═╝██║░░░██║███████║",
"              ██║░░██║██╔══╝░░██║░░░██║██╔══██║",
"              ╚█████╔╝███████╗╚██████╔╝██║░░██║",
"              ░╚════╝░╚══════╝░╚═════╝░╚═╝░░╚═╝",}
           alpha.setup(dashboard.config)
	end,
},
}