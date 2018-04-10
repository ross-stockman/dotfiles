export DOTFILES_HOME=~/git/dotfiles
export SECRETS_HOME=~/git/secrets

if [ -f ~/.bashrc_default ]; then
	. ~/.bashrc_default
fi

if [ -f $SECRETS_HOME/.secrets ]; then
	. $SECRETS_HOME/.secrets
fi

. $DOTFILES_HOME/.bash_aliases
. $DOTFILES_HOME/.bash_prompt

export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=$PATH:$JAVA_HOME/bin
