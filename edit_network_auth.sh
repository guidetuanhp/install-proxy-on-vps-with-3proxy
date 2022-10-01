install_3proxy() {
wget https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/3proxyinstaller.sh
chmod +x 3proxyinstaller.sh 
./3proxyinstaller.sh
}

edit_network() {
wget https://raw.githubusercontent.com/guidetuanhp/proxy/main/network20.txt
sudo cp network20.txt /etc/netplan
cd /etc/netplan
sudo cp 50-cloud-init.yaml 51-cloud-init.yaml 
sudo cat 51-cloud-init.yaml network20.txt > 50-cloud-init.yaml
sudo netplan apply
}

update_ip() {
/etc/init.d/3proxyinit start
}
edit_network
echo "sleep 3 seconds"
sleep 3
install_3proxy
update_ip
