#!/bin/bash
# install monexec
tar zxvf monexec_*.tar.gz
cd  monexec_*
cp monexec /usr/bin/
chmod +x /usr/bin/monexec

# #install proxy
tar zxvf proxy-*.tar.gz
cd  proxy-*
cp proxy /usr/bin/
cp proxyd /usr/bin/
chmod +x /usr/bin/proxy
chmod +x /usr/bin/proxyd
if [ ! -e /etc/proxy ]; then
    mkdir /etc/proxy
    cp proxy.toml /etc/proxy/
fi

if [ ! -e /etc/proxy/proxy.crt ]; then
    cd /etc/proxy/
    proxy keygen >/dev/null 2>&1 
fi

if [ ! -e /etc/proxy/blocked ]; then
    cd /etc/proxy/
    cp blocked /etc/proxy/
fi

if [ ! -e /etc/proxy/direct ]; then
    cd /etc/proxy/
    cp direct /etc/proxy/
fii

echo "install done"
proxyd