############################################
# fzf (https://github.com/junegunn/fzf) 
#
# Sebastian Ruml, <sebastian@sebastianruml.name>
# Last edit: 2017.01.25
############################################


# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# cdf - cd into the directory of the selected file
cdf() {
 local file
 local dir
 file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fh - repeat history
fh() {
    eval $( ([ -n "$ZSH_NAME"  ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//' )
}

# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

