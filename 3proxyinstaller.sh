apt-get update && apt-get -y upgrade
apt-get install -y build-essential nano
wget --no-check-certificate https://github.com/3proxy/3proxy/archive/refs/tags/0.8.13.tar.gz
tar xzf 0.8.13.tar.gz
cd 3proxy-0.8.13
make -f Makefile.Linux
cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg

IP=($(dig +short myip.opendns.com @resolver1.opendns.com))
USERNAME=$(< /dev/urandom tr -dc 'A-Za-z' | head -c4)
PASS=$(< /dev/urandom tr -dc 'A-Za-z0-9' | head -c4)
echo "$USERNAME:CL:$PASS" > /etc/3proxy/.proxyauth
chmod 600 /etc/3proxy/.proxyauth
cat .proxyauth
echo $IP:2610:$USERNAME:$PASS
cd /etc/init.d/
wget --no-check-certificate https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/3proxyinit
chmod  +x /etc/init.d/3proxyinit
