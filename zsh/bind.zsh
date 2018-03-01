fzf-git-add() {
  local gitPreview="git diff HEAD --color-words=\"[[:alnum:]_.]+|[^[:space:]]\" --color --exit-code {2}"
  local colorPreview="pygmentize {2} 2> /dev/null"
  local imagePreview="[[ \"\$(file -b -i {2})\" =~ \"^image/\" ]] && timg -g${COLUMNS}x${LINES} {2}"
  local fallbackPreview="cat {2}"
  local previewCmd="${imagePreview} || (${gitPreview} && (${colorPreview} || ${fallbackPreview}))"

  local file="$(git status --short | \
    grep "^.\S" | \
    fzf --multi --reverse --preview-window wrap --preview $previewCmd| \
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

