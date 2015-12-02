FROM alpine:latest

ENV GOPATH=/root/go

RUN \
    apk add --update openssh-client vim nodejs zsh git python go \
&& \
    npm install -g wscat \
&& \
    env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
&& \
    mkdir $GOPATH && \
    go get github.com/constabulary/gb

# other apps to consider:
# https://github.com/mksenzov/i.js
# https://github.com/danielgtaylor/nesh
# https://github.com/jakubroztocil/httpie
# https://github.com/foreverjs/forever
# https://github.com/srsudar/eg
# https://github.com/philovivero/distribution
# https://github.com/facebook/PathPicker

ENV DOTFILE_PATH=/root/.dots \
    DOTFILE_REPO=https://github.com/dudymas/dots \
    DOTFILE_VIMRC=vimrc \
    DOTFILE_ZSHRC=.zshrc \
    ADD_PACKAGE_COMMAND="apk add" \
    REM_PACKAGE_COMMAND="apk remove" \
    ZSH_THEME=random

RUN git clone $DOTFILE_REPO $DOTFILE_PATH

COPY files /

RUN /setup.sh

CMD /bin/zsh
