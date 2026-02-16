source "${HOME}/.zgenom/zgenom.zsh"

ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
  forward-char
  end-of-line
  vi-forward-char
)
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

# if the init scipt doesn't exist
if ! zgenom saved; then
  echo "Creating a zgenom save"

  zgenom load mafredri/zsh-async async.zsh main

  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-completions src

  zgenom save
  zgenom compile "$HOME/.zshrc"
fi

eval "$(starship init zsh)"

bindkey '^y' autosuggest-accept
