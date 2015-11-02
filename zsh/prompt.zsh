#! /bin/zsh
autoload -U colors && colors

export C_BLK=%{$fg[black]%}
export C_RED=%{$fg[red]%}
export C_GRN=%{$fg[green]%}
export C_YLW=%{$fg[yellow]%}
export C_BLU=%{$fg[blue]%}
export C_PRP=%{$fg[purple]%}
export C_CYN=%{$fg[cyan]%}
export C_WHT=%{$fg[white]%}
export C_NON=%{$reset_color%}

export C_ONE=$C_RED
export C_TWO=$C_YLW

export MACHINE="inception"

COLUMNS=$(tput cols)

function dynPrompt() {
    p=$(pwd)
    [[ ${#p} -ge $((($COLUMNS/6)*5-20)) ]] && p=$(echo $p | grep -o "\/[^\/]\{1,3\}" | awk '{print}' ORS='')
	p=$(echo $p | sed -E 's/\/Use\/Yab|\/Users\/Yabes/~/g')

# p=/…/$(echo $p | awk -F / '{print $NF}')


    [[ $1 -eq 0 ]] && export C_DOL=$C_BLU || export C_DOL=$C_RED
#	export PS1="$C_ONE[$C_TWO$(date '+%H:%M')$C_ONE] $C_TWO\u $C_ONE$p$C_NON "
    export PS1="$C_ONE[$C_TWO$(date '+%H:%M')$C_ONE] $C_GRN\u$C_BLU@$C_CYN$MACHINE$C_BLU:$C_PRP$p$C_DOL\n\$ $C_NON"
}

function pColor() {
	[[ -n $1  ]] && export C_ONE=$1
	[[ -n $2  ]] && export C_TWO=$2
}

function pRand() {
	colors=($C_BLK $C_RED $C_GRN $C_YLW $C_BLU $C_PRP $C_CYN $C_WHT $C_NON)
	pColor ${colors[$RANDOM%${#colors[@]}]} ${colors[$RANDOM%${#colors[@]}]}
}

function pMemo() {
	echo "C_BLK, C_RED, C_GRN, C_YLW, C_BLU, C_PRP, C_CYN, C_WHT, C_NON"
}

alias updatePromptPath="cd '$PWD'"
export PS1="${C_ONE}[${C_TWO}$(date '+%H:%M')${C_ONE}] ${C_GRN}%n${C_BLU}@${C_CYN}inception${C_BLU}:${C_PRP}%~${C_DOL}"$'\n'"%# ${C_NON}"
