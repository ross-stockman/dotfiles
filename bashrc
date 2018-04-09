export BASH_HOME=~/git/bash

if [ -f ~/.bashrc_default ]; then
	. ~/.bashrc_default
fi

. $BASH_HOME/aliases
. $BASH_HOME/prompt

export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=$PATH:$JAVA_HOME/bin
