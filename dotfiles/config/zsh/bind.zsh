fzf-git-add() {
  # @TODO: allow to show changed since develop:
  #  git log --name-only --pretty=format: develop.. | sort -u
  #
  #  preview with:
  #   git diff <file> develop..
  local file="$(git status --short |
    grep "^.\S" |
    fzf --multi --reverse --bind "?:toggle-preview" --preview-window nowrap --preview "fzf-preview-file {2}" |
    awk '{ print "'"'"'"$2"'"'"'" }' |
    tr '\n' ' ')"

  local ret=$?
  LBUFFER="${LBUFFER}${file}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N fzf-git-add
bindkey '^G' fzf-git-add

fzf-select-modified-since-ref() {
  local REF=${1:-develop}

  git log --name-only --pretty=format: "${REF}.." |
    sort -u |
    grep -v "^$" |
    fzf \
      --preview-window nowrap \
      --preview "git diff develop.. --color-words='[[:alnum:]_.]+|[^[:space:]]' --color -w -p {} | delta"
}

binded-fzf-select-modified-since-ref() {
  local SELECTED_FILE="$(fzf-select-modified-since-ref)"

  local ret=$?
  LBUFFER="${LBUFFER}${SELECTED_FILE}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N binded-fzf-select-modified-since-ref
bindkey '^F' binded-fzf-select-modified-since-ref

_fzf-directory() {
  local text="$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2>/dev/null | fzf)"
  local ret=$?
  LBUFFER="${LBUFFER}${text}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N _fzf-directory
bindkey '^P' _fzf-directory

_fzf-latest-modified-files() {
  local text="$(git diff --name-only HEAD~10..HEAD . | fzf --preview='git log --color=always -p -- {}')"
  local ret=$?
  LBUFFER="${LBUFFER}${text}"
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

zle -N _fzf-latest-modified-files
bindkey '^H' _fzf-latest-modified-files
