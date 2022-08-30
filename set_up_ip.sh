edit_network() {
wget https://raw.githubusercontent.com/guidetuanhp/proxy/main/network.txt
sudo cp network.txt /etc/netplan
cd /etc/netplan
sudo cp 50-cloud-init.yaml 51-cloud-init.yaml 
sudo cat 51-cloud-init.yaml network.txt > 50-cloud-init.yaml
sudo netplan apply
}

add_ip() {
read -p 'Enter Token: ' TMTOKEN
apt-get update
apt install docker.io
docker network create my_network_1 --driver bridge --subnet 172.18.0.0/16
iptables -t nat -I POSTROUTING -s 172.18.0.0/16 -j SNAT --to-source 10.0.0.4
docker network create my_network_2 --driver bridge --subnet 172.19.0.0/16
iptables -t nat -I POSTROUTING -s 172.19.0.0/16 -j SNAT --to-source 10.0.0.5
docker network create my_network_3 --driver bridge --subnet 172.20.0.0/16
iptables -t nat -I POSTROUTING -s 172.20.0.0/16 -j SNAT --to-source 10.0.0.6
docker network create my_network_4 --driver bridge --subnet 172.21.0.0/16
iptables -t nat -I POSTROUTING -s 172.21.0.0/16 -j SNAT --to-source 10.0.0.7
docker network create my_network_5 --driver bridge --subnet 172.22.0.0/16
iptables -t nat -I POSTROUTING -s 172.22.0.0/16 -j SNAT --to-source 10.0.0.8
docker network create my_network_6 --driver bridge --subnet 172.23.0.0/16
iptables -t nat -I POSTROUTING -s 172.23.0.0/16 -j SNAT --to-source 10.0.0.9
docker network create my_network_7 --driver bridge --subnet 172.24.0.0/16
iptables -t nat -I POSTROUTING -s 172.24.0.0/16 -j SNAT --to-source 10.0.0.10
docker network create my_network_8 --driver bridge --subnet 172.25.0.0/16
iptables -t nat -I POSTROUTING -s 172.25.0.0/16 -j SNAT --to-source 10.0.0.11
docker network create my_network_9 --driver bridge --subnet 172.26.0.0/16
iptables -t nat -I POSTROUTING -s 172.26.0.0/16 -j SNAT --to-source 10.0.0.12
docker network create my_network_10 --driver bridge --subnet 172.27.0.0/16
iptables -t nat -I POSTROUTING -s 172.27.0.0/16 -j SNAT --to-source 10.0.0.13

docker run -d --network my_network_1 --name tm_1 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test1
docker run -d --network my_network_2 --name tm_2 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test2
docker run -d --network my_network_3 --name tm_3 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test3
docker run -d --network my_network_4 --name tm_4 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test4
docker run -d --network my_network_5 --name tm_5 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test5
docker run -d --network my_network_6 --name tm_6 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test6
docker run -d --network my_network_7 --name tm_7 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test7
docker run -d --network my_network_8 --name tm_8 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test8
docker run -d --network my_network_9 --name tm_9 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test9
docker run -d --network my_network_10 --name tm_10 traffmonetizer/cli start accept --token "$TMTOKEN" --device-name test10

}
edit_network
echo "edit_network done"
add_ip
echo "add_ip done"
