3proxy install script for Debian / Ubuntu VPS
======================================================

A simple script (without any russian in it, yeepeeh) to install the lightweight russian proxy: 3proxy (http://3proxy.ru/) as an elite high anonymous HTTP proxy with SSL support with a few command lines. 
This script has been created to bypass the fact that Squid3 proxy isn't compiled with SSL support and is an absolute nightmare to compile in Debian right now.

This setup has been created to quickly install a proxy on small lowendbox VPS mostly for "google rank analysis" / scraping.

**MANUAL :**

Download, make executable and run with these lines :


    
    sudo -i
    wget --no-check-certificate https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/3proxyinstaller.sh
    chmod +x 3proxyinstaller.sh
    ./3proxyinstaller.sh
    /etc/init.d/3proxyinit start
    
    or
    
    sudo -i
    wget --no-check-certificate https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/3proxyinstaller_no_auth.sh
    chmod +x 3proxyinstaller_no_auth.sh
    ./3proxyinstaller_no_auth.sh
    /etc/init.d/3proxyinit_no_auth start


After install : CHANGE THE BLOODY DEFAULT USERNAME AND PASSWORD !!! 

    nano /etc/3proxy/.proxyauth
	
Example change line inside .proxyauth

    proxyuser:CL:proxypassword

You can also change the port, default https is 2610, socks5 is 2617

    nano /etc/3proxy/3proxy.cfg
    
    

Once you've change the username / password you can start the proxy 
(or reboot the VPS as 3proxy has been added to the init scripts and will autostart)

    /etc/init.d/3proxyinit start
	
For Uninstall Download, make executable and run with these lines :

	wget --no-check-certificate https://raw.githubusercontent.com/guidetuanhp/install-proxy-on-vps-with-3proxy/main/3proxyuninst.sh
	chmod +x 3proxyuninst.sh
	./3proxyuninst.sh

**Script tested on 1/7/2022 on the following fresh VPS install distros :**

- Ubuntu 18.04 64bit (Vmware)


