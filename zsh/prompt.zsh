#! /bin/zsh
autoload -U colors && colors

export PS1="$fg[red][$fg[yellow]%D{%H:%M:%S}$fg[red]] $fg[green]%n$fg[blue]@$fg[cyan]%m$fg[blue]:$fg[magenta]%~"$'\n'"%{$fg[blue]%}%# %{$reset_color%}"
