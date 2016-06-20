function extract () {
	if [ -f "$@" ] ; then
		case "$@" in
			*.tar.bz2)	tar -jxvf 	    "$@" ;;
			*.tar.gz)	tar -zxvf 	    "$@" ;;
            *.dmg)      hdiutil mount   "$@" ;;
            *.gs)       gunzip          "$@" ;;
			*.bz2)		bunzip2 	    "$@" ;;
			*.rar)		unrar x 	    "$@" ;;
			*.gz)		gunzip 		    "$@" ;;
			*.tar)		tar xf 		    "$@" ;;
			*.tbz2)		tar xjf 	    "$@" ;;
			*.tgz)		tar xzf 	    "$@" ;;
			*.zip)		unzip 		    "$@" ;;
			*.Z)		uncompress	    "$@" ;;
			*.7z)		7z x 		    "$@" ;;
            *.pax)      cat $@ | pax -r "$@" ;;
			*)	 echo "'$@' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function gitclean () {
  git remote prune origin
  git branch -r --merged master | egrep -iv '(master|develop)' | sed 's/origin\///g' | xargs -n 1 git push --delete origin
}

transfer() {
    if [ $# -eq 0 ]; then
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
        return 1;
    fi

    tmpfile=$( mktemp -t transferXXX );

    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile;
    fi;

    cat $tmpfile;
    rm -f $tmpfile;
}

