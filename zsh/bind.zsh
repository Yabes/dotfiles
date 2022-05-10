fzf-git-add() {
  local file="$(git status --short | \
    grep "^.\S" | \
    fzf --multi --reverse --bind "?:toggle-preview" --preview-window nowrap --preview "fzf-preview-file {2}"| \
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


_fzf-pane() {
  _zsh_autosuggest_clear
  local text="$(fzf-pane)"
  local ret=$?
  LBUFFER="${LBUFFER}${text}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N _fzf-pane
bindkey '^F' _fzf-pane

_fzf-pane-word() {
  local text="$(fzf-pane-word)"
  local ret=$?
  LBUFFER="${LBUFFER}${text}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N _fzf-pane
bindkey '^F' _fzf-pane

_fzf-directory() {
  local text="$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf-tmux)"
  local ret=$?
  LBUFFER="${LBUFFER}${text}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N _fzf-directory
bindkey '^P' _fzf-directory

_fzf-latest-modified-files() {
  local text="$(git diff --name-only HEAD~10..HEAD . | fzf-tmux --preview='git log --color=always -p -- {}')"
  local ret=$?
  LBUFFER="${LBUFFER}${text}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N _fzf-latest-modified-files
bindkey '^H' _fzf-latest-modified-files
