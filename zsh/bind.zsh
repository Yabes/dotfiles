fzf-git-add() {
  local file="$(git status --short | \
    grep "^.\S" | \
    fzf --multi --reverse --preview 'git diff --color {2}' | \
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

