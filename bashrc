export BASH_HOME=~/git/bash

if [ -f ~/.bashrc_default ]; then
	. ~/.bashrc_default
fi

. $BASH_HOME/aliases
. $BASH_HOME/prompt
