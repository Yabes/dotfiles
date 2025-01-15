profile_zsh=false

if $profile_zsh; then
  zmodload zsh/zprof
fi

export HISTFILE=~/.histfile
export HISTSIZE=100000
export SAVEHIST=100000
export HISTCONTROL=ignoredups:erasedups
setopt appendhistory autocd beep notify
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS

# Vim mode
bindkey -v

# Disable = command
unsetopt EQUALS

# Disable r command
disable r

# Set editor
if [[ -z "$EDITOR" ]]; then
  command -v vim >/dev/null 2>&1 && export EDITOR=vim
  command -v nvim >/dev/null 2>&1 && export EDITOR=nvim
fi

#Locale
LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

# Add v command on normal mode to edit current line with $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

export LD_LIBRARY_PATH=/usr/local/lib

# source /home/yabes/.config/broot/launcher/bash/br
# Setup rustup, cargo path
[[ -f $HOME/.rustrc ]] && source $HOME/.rustrc

# Load personal configs
. ~/.config/zsh/path.zsh
. ~/.config/zsh/aliases.zsh
. ~/.config/zsh/functions.zsh
. ~/.config/zsh/completion.zsh
. ~/.config/zsh/bind.zsh
. ~/.config/zsh/fzf.zsh
. ~/.config/zsh/git-aliases.zsh
. ~/.config/zsh/plugins.zsh

export N_PREFIX="$HOME/n"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d $HOME/.rvm ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi

# kubectl
if [ -d $HOME/.kubectl-plugins ]; then
  export PATH="$PATH:$HOME/.kubectl-plugins"
fi

# kitty
if [ -d $HOME/.local/kitty.app/bin ]; then
  export PATH="$HOME/.local/kitty.app/bin:$PATH"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$($HOME/.local/bin/mise activate zsh)"

if $profile_zsh; then
  zprof
fi

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"

if [ -d $HOME/.krew ]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi
