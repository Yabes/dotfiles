source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load mafredri/zsh-async async.zsh main

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen load zsh-users/zsh-completions src

    zgen load chrissicool/zsh-256color

    zgen load sindresorhus/pure . main

    zgen save
fi

bindkey '^y' autosuggest-accept
export ZSH_AUTOSUGGEST_USE_ASYNC=true
