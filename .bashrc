# .bashrc

# User specific aliases and functions
alias pip='pip3'
alias ll='ls -lah'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias clr='clear'
alias diskspace='du -S | sort -n -r | more'
alias folders='find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# Prompt color
#\u - user name
#\h - short hostname
#\W - current working dir
#\? - exit status of the command
#export PS1="\[\e[34m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\] "

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]; then
        STAT=`parse_git_dirty`
	echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}
# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi

    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    
    if [ ! "${bits}" == "" ]; then 
        echo " ${bits}"
    else 
        echo ""
    fi
}

function nonzero_return() {
    RETVAL=$?
    [ $RETVAL -ne 0 ] && echo "$RETVAL"
}

export PS1="\[\e[30;46m\][\[\e[m\]\[\e[30;46m\]\u\[\e[m\]\[\e[30;46m\]@\[\e[m\]\[\e[30;46m\]\h\[\e[m\]\[\e[30;46m\]:\[\e[m\]\[\e[30;46m\]\w\[\e[m\]\[\e[30;46m\]]\[\e[m\]\[\e[42m\][\[\e[m\]\[\e[42m\]\`nonzero_return\`\[\e[m\]\[\e[42m\]]\[\e[m\]\[\e[44m\]\`parse_git_branch\`\[\e[m\] "

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
