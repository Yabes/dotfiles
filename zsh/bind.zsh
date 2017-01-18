fzf-git-add() {
local file=$(git status --short|grep -v "^[^? ]"|fzf|awk '{ print $2 }')
  local ret=$?
  LBUFFER="${LBUFFER}${file}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N fzf-git-add
bindkey '^G' fzf-git-add

