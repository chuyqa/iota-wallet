FROM ubuntu:16.04
RUN apt update && \
    apt install -y x11vnc curl 

WORKDIR /tmp

RUN curl -fSL -o iota_2.5.4_amd64.deb "https://github.com/iotaledger/wallet/releases/download/v2.5.4/iota_2.5.4_amd64.deb"
RUN echo "ce370f439fc07221075e4f3456abe5b450bc5ede032e6bf38696bf7f8effe2a6 iota_2.5.4_amd64.deb" | sha256sum -c -

RUN apt-get install -f /tmp/iota_2.5.4_amd64.deb -y

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd iota123 ~/.vnc/passwd

# Start iota via bashrc
RUN bash -c 'echo "iota" >> ~/.bashrc'

EXPOSE 5900

CMD [ "x11vnc", "-forever", "-usepw", "-create" ]
