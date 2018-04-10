export BASH_HOME=~/git/bash

if [ -f ~/.bashrc_default ]; then
	. ~/.bashrc_default
fi

if [ -f ~/git/secrets/.secrets ]; then
	. ~/git/secrets/.secrets
fi

. $BASH_HOME/.bash_aliases
. $BASH_HOME/.bash_prompt

export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=$PATH:$JAVA_HOME/bin
