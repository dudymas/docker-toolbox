FROM alpine:latest

RUN apk update

RUN apk add openssh-client vim nodejs

RUN npm install -g wscat

RUN apk add zsh git

RUN env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh $HOME/.zsh

RUN apk add python go && mkdir /root/go

RUN GOPATH=/root/go go get github.com/constabulary/gb

# other apps to consider:
# https://github.com/mksenzov/i.js
# https://github.com/danielgtaylor/nesh
# https://github.com/jakubroztocil/httpie
# https://github.com/foreverjs/forever
# https://github.com/srsudar/eg
# https://github.com/philovivero/distribution
# https://github.com/facebook/PathPicker

ENV DOTFILE_PATH=/root/dots
ENV DOTFILE_VIMRC=vimrc
ENV DOTFILE_ZSHRC=zshrc
ENV ZSH_THEME=random
ENV OVERRIDE_GOPATH=1

RUN mkdir $DOTFILE_PATH && \
    touch /root/dots/vimrc && \
    touch /root/dots/zshrc

COPY zshrc /root/.zshrc
COPY vimrc /root/.vimrc

CMD /bin/zsh
