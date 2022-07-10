apt-get update && apt-get -y upgrade
apt-get install -y build-essential nano
wget --no-check-certificate https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/archive/3proxy-0.9.4.tar.gz
tar xzf 3proxy-0.9.4.tar.gz
cd 3proxy-0.9.4
make -f Makefile.Linux
cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg
wget --no-check-certificate https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/.proxyauth
chmod 600 /etc/3proxy/.proxyauth
cd /etc/init.d/
wget --no-check-certificate https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/3proxyinit
chmod  +x /etc/init.d/3proxyinit
update-rc.d 3proxyinit defaults
