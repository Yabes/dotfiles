source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load mafredri/zsh-async async.zsh

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions src

    zgen load chrissicool/zsh-256color

    zgen load sindresorhus/pure

    zgen save
fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=gray"
bindkey '^y' autosuggest-accept
export ZSH_AUTOSUGGEST_USE_ASYNC=true
