# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# N
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Npm/Yarn
export PATH="$PATH:$HOME/.npm-global/bin"
command -v yarn >/dev/null 2>&1 && export PATH="$(yarn global bin):$PATH"


# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Local
export PATH="$PATH:$HOME/.local/bin"

# Cargo
export PATH="$PATH:$HOME/.cargo/bin"

# GKE
export PATH="$PATH:$HOME/linux-amd64:$HOME/kubernetes/client/bin"

# dotfiles bin
export PATH="$HOME/.dotfiles/bin:$PATH"

# Google Cloud SDK.
if [ -f '/home/developer/google-cloud-sdk/path.zsh.inc' ]; then . '/home/developer/google-cloud-sdk/path.zsh.inc'; fi

# Krew
[ -d ~/.krew ] && export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
