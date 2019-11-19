# Custom FZF completion
# TODO Add header
_fzf_complete_lxc() {
  _fzf_complete "-m --header-lines=1" "$@" < <( lxc list | grep "^| " )
}

_fzf_complete_lxc_post() {
  awk '{ print $2 }'
}

_fzf_complete_gp() {
  ARGS="$@"

  if [[ $ARGS == 'gp -u'* ]]; then
    _fzf_complete "-m" "$@" < <(git branch -vv | cut -c 3- | awk '$3 !~/\[/ { print $1 }')
  else
    _fzf_complete "-m" "$@" < <(git branch --all | grep -v HEAD | sed "s/.* //" | sed "s#remotes/[^/]*/##" | sort -u)
  fi
}

_fzf_complete_g() {
  ARGS="$@"

  if [[ $ARGS == 'g co '* ]]; then
    _fzf_complete "-m" "$@" < <(git branch --all | grep -v HEAD | sed "s/.* //" | sed "s#remotes/[^/]*/##" | sort -u)
  elif [[ $ARGS == 'g merge '* ]]; then
    _fzf_complete "-m" "$@" < <(git branch --no-merged | grep -v HEAD | sed "s/.* //" | sed "s#remotes/[^/]*/##" | sort -u)
  else
    eval "zle ${fzf_default_completion:-expend-or-complete}"
  fi
}

_fzf_complete_kubectl() {
  ARGS="$@"

  if [[ $ARGS == *'-c'* ]]; then
    local POD=$(echo $ARGS | awk '{ print $3 }')
    _fzf_complete "--header-lines=1 --select-1 --exit-0" "$@" < <(
      kubectl get pods -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{range .spec.containers[*]}{" "}{.name}{end}{end}' | grep ${POD} | tr ' ' '\n'
    )
  elif [[ $ARGS == 'kubectl exec'* ]]; then
    local NAMESPACE=$(kubectl config view | grep namespace: | awk '{ print $2  }' | uniq | fzf-tmux --select-1)
    local PODNAME=$(kubectl get pods -n ${NAMESPACE} | fzf-tmux --header-lines=1 --nth=1 | awk '{ print $1 }')
    local CONTAINER=$(kubectl get pods -n ${NAMESPACE} ${PODNAME} -o=jsonpath='{range .spec.containers[*]}{.name}{"\n"}{end}' | fzf-tmux --select-1)
    _fzf_complete "--select-1" "$@" < <(echo "${PODNAME} -c ${CONTAINER}")
  else
    eval "zle ${fzf_default_completion:-expend-or-complete}"
  fi
}

_fzf_complete_kubectl_notrigger() {
  FZF_COMPLETION_TRIGGER='' _fzf_complete_kubectl
}

_fzf_complete_kubectl_post() {
  awk '{ print $0 }'
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
    fzf-tmux -l50 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fshow - git commit browser (enter for show, ctrl-d for diff, ` toggles sort)
fshow() {
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cn %cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --tiebreak=index \
          --bind "?:toggle-preview"  --preview-window wrap --preview 'local sha1=$(echo {} | sed -n "s|[*| ]*\([a-z0-9]\{7\}\).*|\1|p"); [ -n "$sha1" ] && git show --color -m $sha1 '"$@" \
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

# https://gist.github.com/junegunn/a563d9e3e07fd721d618562762ec619d
gstash() {
  local out k reflog
  out=(
    $(git stash list --pretty='%C(yellow)%gd %>(14)%Cgreen%cr %C(blue)%gs' |
      fzf --ansi --no-sort --header='enter:show, ctrl-d:diff, ctrl-o:pop, ctrl-y:apply, ctrl-x:drop' \
          --preview='git stash show --color=always -p $(cut -d" " -f1 <<< {}) | head -'$LINES \
          --preview-window=down:50% --reverse \
          --bind='enter:execute(git stash show --color=always -p $(cut -d" " -f1 <<< {}) | less -r > /dev/tty)' \
          --bind='ctrl-d:execute(git diff --color=always $(cut -d" " -f1 <<< {}) | less -r > /dev/tty)' \
          --expect=ctrl-o,ctrl-y,ctrl-x))
  k=${out[0]}
  reflog=${out[1]}
  [ -n "$reflog" ] && case "$k" in
    ctrl-o) git stash pop $reflog ;;
    ctrl-y) git stash apply $reflog ;;
    ctrl-x) git stash drop $reflog ;;
  esac
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
  [[ -n "$files" ]] && ${EDITOR} -p $(echo ${files})
}

# https://github.com/junegunn/fzf/wiki/Examples
# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# https://github.com/junegunn/fzf/wiki/Examples#tmux
# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0 --header='enter:switch, ctrl-x:kill' --bind='ctrl-x:execute(tmux kill-session -t {})') &&
  tmux switch-client -t "$session"
}
