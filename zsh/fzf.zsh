# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# If ag or pt is present adapt fzf default command, with a preference for rg
command -v ag >/dev/null 2>&1 && export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore custom_plugins -g ""'
command -v pt >/dev/null 2>&1 && export FZF_DEFAULT_COMMAND='pt --hidden -g=""'
command -v rg >/dev/null 2>&1 && export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# From https://github.com/junegunn/dotfiles
# fd - cd to selected directory
fd() {
  DIR=`find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf-tmux` \
    && cd "$DIR"
}

# fda - including hidden directories
fda() {
  DIR=`find ${1:-.} -type d 2> /dev/null | fzf-tmux` && cd "$DIR"
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fshow - git commit browser (enter for show, ctrl-d for diff, ` toggles sort)
fshow() {
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --tiebreak=index \
          --bind "?:toggle-preview"  --preview 'local sha1=$(echo {} | sed -n "s|[*| ]*\([a-z0-9]\{7\}\).*|\1|p"); [ -n "$sha1" ] && git show --color $sha1' \
          --print-query --expect=ctrl-d,enter); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue

    if [ "$k" = 'ctrl-d' ]; then
      git diff --color=always $shas | less -R
    elif [ "$k" = 'enter' ]; then
      echo $shas
      break
    fi
  done
}

# frg - search for a pattern & refine search with name & preview
frg() {
  rg -l $1 | fzf --multi --bind "?:toggle-preview" --preview "rg --color='always' --line-number $1 {1}"
}
