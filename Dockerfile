FROM debian:buster

RUN echo "America/Chicago" > /etc/timezone && \
    ln -fs /usr/share/zoneinfo/`cat /etc/timezone` /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get update && \
    apt-get install -y asciidoc bash bc binutils bzip2 fastjar flex gawk gcc genisoimage \
                       gettext git intltool jikespg libgtk2.0-dev libncurses5-dev libssl-dev make \
                       mercurial patch perl-modules python2.7-dev rsync ruby sdcc subversion unzip util-linux \
                       wget xsltproc zlib1g-dev

RUN  useradd -m build
USER build
ENV  HOME /home/build

WORKDIR $HOME

COPY . .
RUN  ./download.sh ar71xx-1806