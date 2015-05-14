ZSH=/root/.zsh

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $DOTFILE_PATH/$DOTFILE_ZSHRC

if [ $OVERRIDE_GOPATH -eq 1 ] ; then
    export GOPATH=/root/go
    export PATH=$PATH:$GOPATH/bin
fi

