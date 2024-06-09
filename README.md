## Neovim Config

Welcome to my neovim configuration file.
As the configuration gets bigger, I'll make more documentation about how this config is structured.
Currently there's 48 plugins currently.
Nothing new unique plugins atm.

## TODO

Potentially put plugin specific commands into files they belong in
When in a table (lua, python dictionary, json etc.), have a comma be placed after opening brackets

## Requirements

fd - For Faster finder for Telescope, and for Telescope-file-browser to work
rg - Telescope live_grep and faster grep

export PROMPT='%{$fg_bold[magenta]%}Bennys%{$reset_color%} %{$fg[cyan]%}%~/%{$reset_color%} ${vcs_info_msg_0_}${NEWLINE}${ARROW} '
