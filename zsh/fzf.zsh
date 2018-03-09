# Custom FZF completion
# TODO Add header
_fzf_complete_lxc() {
  _fzf_complete "-m --header-lines=1" "$@" < <( lxc list | grep "^| " )
}

_fzf_complete_lxc_post() {
  awk '{ print $2 }'
}

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_TMUX=1

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
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cn %cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --tiebreak=index \
          --bind "?:toggle-preview"  --preview-window wrap --preview 'local sha1=$(echo {} | sed -n "s|[*| ]*\([a-z0-9]\{7\}\).*|\1|p"); [ -n "$sha1" ] && git show --color $sha1 '"$@" \
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


frun() {
  cmds=$(npm run)
  cmd=$(echo $cmds | grep "^  \w" | fzf --bind "?:toggle-preview" --preview "echo '${cmds}' | grep -A 1 '^  {1}$' | tail -1 | sed 's/  //g'" | sed 's/ //g')

  if [ -n "$cmd" ]; then
    echo "Executing 'npm run ${cmd}'"
    npm run $cmd
  fi
}

fstash() {
  stashList=$(git stash list)
  stashLine=$(echo $stashList | fzf --bind "?:toggle-preview" --preview 'git stash show -p --color `echo {1} | tr -d ":"`')
  stashName=$(echo "$stashLine" | awk -F ':' '{ print $1 }')

  if [ ! -z "${stashName}" ]; then
    git stash pop $stashName
  fi
}

# Modified from
# http://owen.cymru/sf-a-quick-way-to-search-for-some-thing-in-bash-and-edit-it-with-vim-2/
sf() {
  if [ "$#" -lt 1 ]; then
    echo "Supply string to search for!"
    return 1
  fi

  search=$@

  rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always"'

  files=`eval $rg_command $search | fzf --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}'`
  [[ -n "$files" ]] && gvim -p $(echo ${files})
}

# https://github.com/junegunn/fzf/wiki/Examples
# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# https://github.com/junegunn/fzf/issues/997
fs() {
	local -r fmt='#{session_id}:|#S|(#{session_attached} attached)'
	{ tmux display-message -p -F "$fmt" && tmux list-sessions -F "$fmt"; } \
		| awk '!seen[$1]++' \
		| column -t -s'|' \
		| fzf -q '$' --reverse --prompt 'switch session: ' -1 \
		| cut -d':' -f1 \
		| xargs tmux switch-client -t
}
