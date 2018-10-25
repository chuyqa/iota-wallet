FROM ubuntu:16.04
RUN apt update && \
    apt install -y x11vnc curl xvfb libasound2

WORKDIR /tmp

RUN curl -fSL -o iota_2.5.7_amd64.deb "https://github.com/iotaledger/wallet/releases/download/v2.5.7/iota_2.5.7_amd64.deb"
RUN echo "987db9428608772e5223922f8380cfae3830ee2de838f831bd1d5620e7713f9e iota_2.5.7_amd64.deb" | sha256sum -c -

RUN apt-get install -f /tmp/iota_2.5.7_amd64.deb -y

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd iota123 ~/.vnc/passwd

# Start iota via bashrc
RUN bash -c 'echo "iota" >> ~/.bashrc'

EXPOSE 5900

CMD [ "x11vnc", "-forever", "-usepw", "-create" ]
