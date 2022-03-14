alias ideac='/c/Program\ Files/JetBrains/IntelliJ\ IDEA\ Community\ Edition\ 2021.1/bin/idea.bat'
alias rstudio='/c/Program\ Files/RStudio/bin/rstudio.exe'




# Automatically activate a conda environment if one exists in the starting directory
if [[ -f "./environment.yml" ]]
then
    eval "$(conda shell.bash hook)" # This line is required to use conda commands in a bash script
    conda activate ./env
fi


# Allow symlinks (requires developer mode to be on)
export MSYS=winsymlinks:nativestrict




# Inform windows terminal of the current directory
__wt_osc9-9 () {
    _win_path="$(cygpath -m $(pwd))"
    printf "\033]9;9;\"%s\"\033\\" "$_win_path"
}

[ -n "$BASH_VERSION" ] && [ -n "$WT_SESSION" ] && PROMPT_COMMAND="__wt_osc9-9"







# Configuring the terminal

FMT_RESET="\[\e[0m\]"
FMT_BOLD="\[\e[1m\]"
FMT_DIM="\[\e[2m\]"
FMT_UNBOLD="\[\e[22m\]"
FMT_UNDIM="\[\e[22m\]"

FG_DEFAULT="\[\e[39m\]"
FG_BLACK="\[\e[30m\]"
FG_RED="\[\e[31m\]"
FG_GREEN="\[\e[32m\]"
FG_YELLOW="\[\e[33m\]"
FG_BLUE="\[\e[34m\]"
FG_MAGENTA="\[\e[35m\]"
FG_CYAN="\[\e[36m\]"
FG_LIGHTGRAY="\[\e[37m\]"
FG_DARKGRAY="\[\e[90m\]"
FG_LIGHTRED="\[\e[91m\]"
FG_LIGHTGREEN="\[\e[92m\]"
FG_LIGHTYELLOW="\[\e[93m\]"
FG_LIGHTBLUE="\[\e[94m\]"
FG_LIGHTMAGENTA="\[\e[95m\]"
FG_LIGHTCYAN="\[\e[96m\]"
FG_WHITE="\[\e[97m\]"

BG_DEFAULT="\[\e[49m\]"
BG_BLACK="\[\e[40m\]"
BG_RED="\[\e[41m\]"
BG_GREEN="\[\e[42m\]"
BG_YELLOW="\[\e[43m\]"
BG_BLUE="\[\e[44m\]"
BG_MAGENTA="\[\e[45m\]"
BG_CYAN="\[\e[46m\]"
BG_LIGHTGRAY="\[\e[47m\]"
BG_DARKGRAY="\[\e[100m\]"
BG_LIGHTRED="\[\e[101m\]"
BG_LIGHTGREEN="\[\e[102m\]"
BG_LIGHTYELLOW="\[\e[103m\]"
BG_LIGHTBLUE="\[\e[104m\]"
BG_LIGHTMAGENTA="\[\e[105m\]"
BG_LIGHTCYAN="\[\e[106m\]"
BG_WHITE="\[\e[107m\]"

PS1='\[\033]0;$TITLEPREFIX : \W\007\]'
PS1+='\n'
PS1+="${FG_BLACK}${BG_GREEN}"
PS1+=' \u@\h '
PS1+="${FG_GREEN}${BG_YELLOW}"
PS1+=''
PS1+="${FG_BLACK}"
PS1+=' \w '
PS1+="${FG_YELLOW}"
PS1+='$(__git_ps1 "'"${BG_LIGHTCYAN}"''"${FG_BLACK}"' %s  '"${FG_LIGHTCYAN}"'")'
PS1+='$(if [ "$CONDA_DEFAULT_ENV" != "" ]; then echo "'"${BG_LIGHTGREEN}"''"${FG_BLACK}"' $(basename $CONDA_DEFAULT_ENV) '"${FG_LIGHTGREEN}"'"; fi)'
PS1+="${BG_DEFAULT}"
PS1+=''
PS1+="${FMT_RESET}"
PS1+=$'\n'
PS1+='$ '
