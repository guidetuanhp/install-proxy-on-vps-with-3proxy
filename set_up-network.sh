edit_network() {
wget https://raw.githubusercontent.com/guidetuanhp/proxy/main/network.txt
sudo cp network.txt /etc/netplan
cd /etc/netplan
sudo cp 50-cloud-init.yaml 51-cloud-init.yaml 
sudo cat 51-cloud-init.yaml network.txt > 50-cloud-init.yaml
sudo netplan apply
}
edit_network
