# Npm/Yarn
export PATH="$PATH:$HOME/.npm-global/bin"

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# N
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Cargo
export PATH="$PATH:$HOME/.cargo/bin"

# GKE
export PATH="$PATH:$HOME/linux-amd64:$HOME/kubernetes/client/bin"

# dotfiles bin
export PATH="$PATH:$HOME/.dotfiles/bin"

# Google Cloud SDK.
if [ -f '/home/developer/google-cloud-sdk/path.zsh.inc' ]; then . '/home/developer/google-cloud-sdk/path.zsh.inc'; fi
