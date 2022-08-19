install_3proxy() {
wget https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/3proxyinstaller_no_auth.sh
chmod +x 3proxyinstaller_no_auth.sh 
./3proxyinstaller_no_auth.sh
}

edit_network() {
wget https://raw.githubusercontent.com/guidetuanhp/proxy/main/network.txt
sudo cp network.txt /etc/netplan
cd /etc/netplan
sudo cp 50-cloud-init.yaml 51-cloud-init.yaml 
sudo cat 51-cloud-init.yaml network.txt > 50-cloud-init.yaml
sudo netplan apply
}

update_ip() {
/etc/init.d/3proxyinit_no_auth start
}
install_3proxy
edit_network
echo "sleep 3 seconds"
sleep 3
update_ip
