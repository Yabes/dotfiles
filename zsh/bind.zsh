fzf-git-add() {
  local file="$(git status --short | \
    grep "^.\S" | \
    fzf --multi --reverse --preview-window wrap --preview 'git diff HEAD --word-diff=color --color --exit-code {2} && (pygmentize {2} || cat {2})' | \
    awk '{ print $2 }' | \
    tr '\n' ' ')"
  local ret=$?
  LBUFFER="${LBUFFER}${file}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N fzf-git-add
bindkey '^G' fzf-git-add

