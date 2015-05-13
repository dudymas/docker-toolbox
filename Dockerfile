FROM alpine:latest

RUN apk update

RUN apk add openssh-client vim nodejs

RUN npm install -g wscat

RUN apk add zsh git

RUN env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh $HOME/.zsh

RUN apk add python go

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

RUN mkdir $DOTFILE_PATH && \
    touch $DOTFILE_PATH/$DOTFILE_VIMRC && \
    touch $DOTFILE_PATH/$DOTFILE_ZSHRC

COPY zshrc /root/.zshrc
COPY vimrc /root/.vimrc

CMD /bin/zsh
