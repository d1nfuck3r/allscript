#!/bin/bash

if [ $USER != 'root' ]; then
	echo "Sorry, for run the script please using root user"
	exit
fi

# check OS
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

myip=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	myip=$(wget -qO- ipv4.icanhazip.com)
fi
MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

#source file
	source="http://th-1.lowclass-vpn.ga:81/dinfucker"

# go to root
cd

# check registered ip
wget -q -O IP $source/IP.txt
if ! grep -w -q $MYIP IP; then
echo ""
echo "Please Register IP Nowwww!"
        echo "     
                       
    =============== OS-32 & 64-bit ================
                                                   									
            AUTOSCRIPT CREATED BY D1NFUCK3R         
                 -----------About Us------------       					
                   Tel : +66969636900                                   
                {            FACEBOOK          }           				   
              http://facebook.com/beerwaiting        				 
                    Nickname : d1nfuck3r          					 
      ..........................................
		
                 true: 40 wallet = 1IP        	       
                   *****************           				  
                       TRUE WALLET             	    
                   =================              
                   No   : 0969636900                
                   Name : The'MarCusy             
       ..........................................                                                    								   
    =============== OS-32 & 64-bit ================
                                    
                    Thank You For Choice Us"

	echo "( D1NFUCK3R )"
	
	cd
	rm IP
	rm -rf IP
	rm debian.sh
	rm *.sh
	exit
fi

clear
echo "=============================="
echo "    Welcome to DIN JONE KAI TA ROK    "
echo " Auto Script SSH VPN PPTP ON PANEL "
echo "    Support Debian 6,7,8  OS 32&64       "
echo "=============================="
echo " Type 'I' For Non-Local VPS "
echo " Type 'L' For Local VPS "
echo "=============================="
read -p "Location : " -e loc
apt-get update

# go to root
cd

# remove unused
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# install wget and curl
apt-get update;apt-get -y install wget curl;

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# set repo
ver=`cat /etc/debian_version`
if [ $ver = '6.0' ]
then
debver='6'
elif [ $ver = '6.1' ]
then
debver='6'
elif [ $ver = '6.2' ]
then
debver='6'
elif [ $ver = '6.3' ]
then
debver='6'
elif [ $ver = '6.4' ]
then
debver='6'
elif [ $ver = '6.5' ]
then
debver='6'
elif [ $ver = '6.6' ]
then
debver='6'
elif [ $ver = '6.7' ]
then
debver='6'
elif [ $ver = '6.8' ]
then
debver='6'
elif [ $ver = '6.9' ]
then
debver='6'
elif [ $ver = '7.0' ]
then
debver='7'
elif [ $ver = '7.1' ]
then
debver='7'
elif [ $ver = '7.2' ]
then
debver='7'
elif [ $ver = '7.3' ]
then
debver='7'
elif [ $ver = '7.4' ]
then
debver='7'
elif [ $ver = '7.5' ]
then
debver='7'
elif [ $ver = '7.6' ]
then
debver='7'
elif [ $ver = '7.7' ]
then
debver='7'
elif [ $ver = '7.8' ]
then
debver='7'
elif [ $ver = '7.9' ]
then
debver='7'
elif [ $ver = '8.0' ]
then
debver='8'
elif [ $ver = '8.1' ]
then
debver='8'
elif [ $ver = '8.2' ]
then
debver='8'
elif [ $ver = '8.3' ]
then
debver='8'
elif [ $ver = '8.4' ]
then
debver='8'
elif [ $ver = '8.5' ]
then
debver='8'
elif [ $ver = '8.6' ]
then
debver='8'
elif [ $ver = '8.7' ]
then
debver='8'
elif [ $ver = '8.8' ]
then
debver='8'
elif [ $ver = '8.9' ]
then
debver='8'
else
debver='Null'
fi
if [ $debver = '6' ]; then
	if [[ "$loc" = "I" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian7"
		wget "$source/repo/dotdeb.gpg"
		cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	elif [[ "$loc" = "L" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian7.lokal"
		wget "$source/repo/dotdeb.gpg"
		apt-key add dotdeb.gpg
		rm dotdeb.gpg
		apt-get install python-software-properties 
		apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	elif [[ "$loc" = "i" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian7"
		wget "$source/repo/dotdeb.gpg"
		cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	elif [[ "$loc" = "l" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian7.lokal"
		wget "$source/repo/dotdeb.gpg"
		apt-key add dotdeb.gpg
		rm dotdeb.gpg
		apt-get install python-software-properties 
		apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	fi
elif [ $debver = '7' ]; then
	if [[ "$loc" = "I" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian7"
		wget "$source/repo/dotdeb.gpg"
		cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	elif [[ "$loc" = "L" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian7.lokal"
		wget "$source/repo/dotdeb.gpg"
		apt-key add dotdeb.gpg
		rm dotdeb.gpg
		apt-get install python-software-properties 
		apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	elif [[ "$loc" = "i" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian7"
		wget "$source/repo/dotdeb.gpg"
		cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	elif [[ "$loc" = "l" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian7.lokal"
		wget "$source/repo/dotdeb.gpg"
		apt-key add dotdeb.gpg
		rm dotdeb.gpg
		apt-get install python-software-properties 
		apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	fi
elif [ $debver = '8' ]; then
	if [[ "$loc" = "I" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian8"
		wget "$source/repo/dotdeb.gpg"
		cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	elif [[ "$loc" = "L" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian8.lokal"
		wget "$source/repo/dotdeb.gpg"
		apt-key add dotdeb.gpg
		rm dotdeb.gpg
		apt-get install python-software-properties 
		apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	elif [[ "$loc" = "i" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian8"
		wget "$source/repo/dotdeb.gpg"
		cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	elif [[ "$loc" = "l" ]]; then
		wget -O /etc/apt/sources.list "$source/repo/sources.list.debian8.lokal"
		wget "$source/repo/dotdeb.gpg"
		apt-key add dotdeb.gpg
		rm dotdeb.gpg
		apt-get install python-software-properties 
		apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
		cd /root
		wget http://www.webmin.com/jcameron-key.asc
		apt-key add jcameron-key.asc
		cd
		apt-get update
	fi
else
	cd
fi

gpg --keyserver pgpkeys.mit.edu --recv-key  9D6D8F6BC857C906      
gpg -a --export 9D6D8F6BC857C906 | sudo apt-key add -
gpg --keyserver pgpkeys.mit.edu --recv-key  7638D0442B90D010      
gpg -a --export 7638D0442B90D010 | sudo apt-key add -

# update
apt-get update

# Install Essential Package
apt-get -y install build-essential

# Install Webmin
apt-get -y install webmin
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
service webmin restart

# OpenSSH Setting
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
service ssh restart

# Install Dropbear
apt-get install zlib1g-dev dpkg-dev dh-make -y
wget $source/repo/dropbear-2014.63.tar.bz2
tar jxvf dropbear-2014.63.tar.bz2
cd dropbear-2014.63
dpkg-buildpackage
cd ..
OS=`uname -m`;
if [ $OS = 'i686' ]; then
	dpkg -i dropbear_2014.63-0.1_i386.deb
elif [ $OS = 'x86_64' ]; then
	dpkg -i dropbear_2014.63-0.1_amd64.deb
fi
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 110 -p 109 -p 999"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart
cd

# Install Webserver Port 81
apt-get install nginx php5 libapache2-mod-php5 php5-fpm php5-cli php5-mysql php5-mcrypt libxml-parser-perl -y
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.old
curl $source/repo/nginx.conf > /etc/nginx/nginx.conf
curl $source/repo/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/uptime.php "http://autoscript.kepalatupai.com/uptime.php1"
wget -O /home/vps/public_html/index.html "https://raw.githubusercontent.com/GegeEmbrie/autosshvpn/master/addons/index.html1"
service php5-fpm restart
service nginx restart
cd

# Install VNSTAT
apt-get install vnstat -y
cd /home/vps/public_html/
wget $source/repo/vnstat_php_frontend-1.5.1.tar.gz
tar xf vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 vnstat
cd vnstat
if [[ `ifconfig -a | grep "venet0"` ]]
then
cekvirt='OpenVZ'
elif [[ `ifconfig -a | grep "venet0:0"` ]]
then
cekvirt='OpenVZ'
elif [[ `ifconfig -a | grep "venet0:0-00"` ]]
then
cekvirt='OpenVZ'
elif [[ `ifconfig -a | grep "venet0-00"` ]]
then
cekvirt='OpenVZ'
elif [[ `ifconfig -a | grep "eth0"` ]]
then
cekvirt='KVM'
elif [[ `ifconfig -a | grep "eth0:0"` ]]
then
cekvirt='KVM'
elif [[ `ifconfig -a | grep "eth0:0-00"` ]]
then
cekvirt='KVM'
elif [[ `ifconfig -a | grep "eth0-00"` ]]
then
cekvirt='KVM'
fi
if [ $cekvirt = 'KVM' ]; then
	sed -i 's/eth0/eth0/g' config.php
	sed -i "s/\$iface_list = array('eth0', 'sixxs');/\$iface_list = array('eth0');/g" config.php
	sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
	sed -i 's/Internal/Internet/g' config.php
	sed -i '/SixXS IPv6/d' config.php
	cd
elif [ $cekvirt = 'OpenVZ' ]; then
	sed -i 's/eth0/venet0/g' config.php
	sed -i "s/\$iface_list = array('venet0', 'sixxs');/\$iface_list = array('venet0');/g" config.php
	sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
	sed -i 's/Internal/Internet/g' config.php
	sed -i '/SixXS IPv6/d' config.php
	cd
else
	cd
fi

# Install Fail2Ban
apt-get -y install fail2ban;service fail2ban restart

# Instal (D)DoS Deflate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to d1nfuck3r.com'

# Install BadVPN
apt-get -y install cmake make gcc
wget $source/repo/badvpn-1.999.127.tar.bz2
tar xf badvpn-1.999.127.tar.bz2
mkdir badvpn-build
cd badvpn-build
cmake ~/badvpn-1.999.127 -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
make install
screen badvpn-udpgw --listen-addr 127.0.0.1:7300 > /dev/null &
cd

# Install Squid
apt-get -y install squid3
wget -O /etc/squid3/squid.conf $source/repo/squid3.conf
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

# OpenVPN
apt-get install openvpn 
wget -O /etc/openvpn/openvpn.tar "$source/openvpn/openvpn-debian.tar"
cd /etc/openvpn/
tar xf openvpn.tar
wget -O /etc/openvpn/1194.conf "$source/openvpn/1194.conf"
service openvpn restart
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
wget -O /etc/iptables.conf "$source/openvpn/iptables.conf"
sed -i '$ i\iptables-restore < /etc/iptables.conf' /etc/rc.local
 
myip2="s/ipserver/$myip/g";
sed -i $myip2 /etc/iptables.conf;
 
iptables-restore < /etc/iptables.conf
service openvpn restart
 
# configure openvpn client config
cd /etc/openvpn/
wget -O /etc/openvpn/1194-client.ovpn "$source/openvpn/1194-client.conf"
usermod -s /bin/false mail
echo "mail:fuck3r" | chpasswd
useradd -s /bin/false -M d1n
echo "d1n:fuck3r" | chpasswd
#tar cf client.tar 1194-client.ovpn
cp /etc/openvpn/1194-client.ovpn /home/vps/public_html/
sed -i $myip2 /home/vps/public_html/1194-client.ovpn
sed -i "s/ports/55/" /home/vps/public_html/1194-client.ovpn

# install pptp vpn
wget $source/repo/pptp.sh
chmod +x pptp.sh
./pptp.sh

# download script
cd
wget -O /usr/bin/benchmark $source/menu/benchmark.sh
wget -O /usr/bin/speedtest $source/menu/speedtest_cli.py
wget -O /usr/bin/ps-mem $source/menu/ps_mem.py
wget -O /etc/issue.net $source/menu/bannerssh

# encrypted script
wget -O /usr/bin/autokill $source/menu/autokill
wget -O /usr/bin/dropmon $source/menu/dropmon
wget -O /usr/bin/menu $source/menu/menu
wget -O /usr/bin/user-active-list $source/menu/user-active-list
wget -O /usr/bin/user-add $source/menu/user-add
wget -O /usr/bin/user-add-pptp $source/menu/user-add-pptp
wget -O /usr/bin/user-del $source/menu/user-del
wget -O /usr/bin/disable-user-expire $source/menu/disable-user-expire
wget -O /usr/bin/delete-user-expire $source/menu/delete-user-expire
wget -O /usr/bin/banned-user $source/menu/banned-user
wget -O /usr/bin/banner $source/menu/banner
wget -O /usr/bin/user-expire-list $source/menu/user-expire-list
wget -O /usr/bin/user-gen $source/menu/user-gen
wget -O /usr/bin/user-limit $source/menu/user-limit
wget -O /usr/bin/user-list $source/menu/user-list
wget -O /usr/bin/user-login $source/menu/user-login
wget -O /usr/bin/user-pass $source/menu/user-pass
wget -O /usr/bin/user-renew $source/menu/user-renew
wget -O /usr/bin/edit-port $source/menu/edit-port
wget -O /usr/bin/edit-port-dropbear $source/menu/edit-port-dropbear
wget -O /usr/bin/edit-port-openssh $source/menu/edit-port-openssh
wget -O /usr/bin/edit-port-squid $source/menu/edit-port-squid
wget -O /usr/bin/edit-port-openvpn $source/menu/edit-port-openvpn
wget -O /usr/bin/update $source/menu/update

chmod +x /usr/bin/benchmark
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/ps-mem

chmod +x /usr/bin/autokill
chmod +x /usr/bin/dropmon
chmod +x /usr/bin/menu
chmod +x /usr/bin/user-active-list
chmod +x /usr/bin/user-add
chmod +x /usr/bin/user-add-pptp
chmod +x /usr/bin/user-del
chmod +x /usr/bin/disable-user-expire
chmod +x /usr/bin/delete-user-expire
chmod +x /usr/bin/banned-user
chmod +x /usr/bin/banner
chmod +x /usr/bin/user-expire-list
chmod +x /usr/bin/user-gen
chmod +x /usr/bin/user-limit
chmod +x /usr/bin/user-list
chmod +x /usr/bin/user-login
chmod +x /usr/bin/user-pass
chmod +x /usr/bin/user-renew
chmod +x /usr/bin/edit-port
chmod +x /usr/bin/edit-port-dropbear
chmod +x /usr/bin/edit-port-openssh
chmod +x /usr/bin/edit-port-squid
chmod +x /usr/bin/edit-port-openvpn
chmod +x /usr/bin/update

#shc make
cd
wget $source/menu/instalshc.sh
chmod +x /root/instalshc.sh
/root/instalshc.sh
rm /root/instalshc.sh

# finishing
chown -R www-data:www-data /home/vps/public_html
service cron restart
service nginx start
service php5-fpm start
service vnstat restart
service snmpd restart
service ssh restart
service dropbear restart
service fail2ban restart
service squid3 restart
service webmin restart
cd
rm -f /root/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# info
clear
echo "Autoscript Include:" | tee log-install.txt
echo "=======================================================" | tee -a log-install.txt
echo "Service :" | tee -a log-install.txt
echo "---------" | tee -a log-install.txt
echo "OpenSSH  : 22, 143" | tee -a log-install.txt
echo "Dropbear : 443, 110, 109" | tee -a log-install.txt
echo "Squid3   : 8000, 8080, 3128 (limit to IP $MYIP)" | tee -a log-install.txt
echo "OpenVPN  : TCP 1194 (client config : http://$MYIP/client.ovpn)" | tee -a log-install.txt
echo "badvpn   : badvpn-udpgw port 7300" | tee -a log-install.txt
echo "PPTP VPN : TCP 1723" | tee -a log-install.txt
echo "nginx    : 80" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Tools :" | tee -a log-install.txt
echo "-------" | tee -a log-install.txt
echo "axel, bmon, htop, iftop, mtr, rkhunter, nethogs: nethogs $ether" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Script :" | tee -a log-install.txt
echo "--------" | tee -a log-install.txt
echo "screenfetch" | tee -a log-install.txt
echo " พิมพ์ menu (คำสั่งในเมนูแบบคร่าวๆ) :" | tee -a log-install.txt
echo "  - สร้างบัญชี SSH/OpenVPN (user-add)" | tee -a log-install.txt
echo "  - สร้างบัญชีแบบสุ่ม SSH/OpenVPN (user-gen)" | tee -a log-install.txt
echo "  - Ganti Password Akun SSH/OpenVPN (user-pass)" | tee -a log-install.txt
echo "  - Tambah Masa Aktif Akun SSH/OpenVPN (user-renew)" | tee -a log-install.txt
echo "  - ลบบัญชี SSH/OpenVPN (user-del)" | tee -a log-install.txt
echo "  - สร้างบัญชี PPTP VPN (user-add-pptp)" | tee -a log-install.txt
echo "  - Monitoring Dropbear (dropmon)" | tee -a log-install.txt
echo "  - เช็คบัญชี Login Dropbear, OpenSSH, PPTP VPN, OpenVPN (user-login)" | tee -a log-install.txt
echo "  - Kill Multi Login Manual (1-2 Login) (user-limit)" | tee -a log-install.txt
echo "  - AutoKill Multi Login (2-3 Login) (autokill)" | tee -a log-install.txt
echo "  - เช็คบัญชีทั้งหมดพร้อมวันหมดอายุ (user-list)" | tee -a log-install.txt
echo "  - บัญชีที่ online ตอนนี้ (user-active-list)" | tee -a log-install.txt
echo "  - บัญชีที่หมดอายุแล้ว (user-expire-list)" | tee -a log-install.txt
echo "  - Disable Akun Expire (disable-user-expire)" | tee -a log-install.txt
echo "  - ลบบัญชีที่หมดอายุแล้ว (delete-user-expire)" | tee -a log-install.txt
echo "  - แบนบัญชีที่ผิดกฏ (banned-user)" | tee -a log-install.txt
echo "  - Restart Dropbear (service dropbear restart)" | tee -a log-install.txt
echo "  - Memory Usage (ps-mem)" | tee -a log-install.txt
echo "  - Speedtest (speedtest --share)" | tee -a log-install.txt
echo "  - Benchmark (benchmark)" | tee -a log-install.txt
echo "  - Restart Webmin (service webmin restart)" | tee -a log-install.txt
echo "  - Edit Banner SSH Login (Dropbear/OpenSSH) (banner)" | tee -a log-install.txt
echo "  - Edit Port (edit-port)" | tee -a log-install.txt
echo "  - Update Script (update)" | tee -a log-install.txt
echo "  - Reboot Server (reboot)" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Fitur lain :" | tee -a log-install.txt
echo "------------" | tee -a log-install.txt
echo "Webmin         : http://$MYIP:10000/" | tee -a log-install.txt
echo "vnstat         : http://$MYIP:81/vnstat/ (เช็ค Bandwith)" | tee -a log-install.txt
echo "MRTG           : http://$MYIP:81/mrtg/" | tee -a log-install.txt
echo "Timezone       : Asia/Bangkok (GMT +7)" | tee -a log-install.txt
echo "Fail2Ban       : [on]" | tee -a log-install.txt
echo "(D)DoS Deflate : [on]" | tee -a log-install.txt
echo "Block Torrent  : [off]" | tee -a log-install.txt
echo "IPv6           : [off]" | tee -a log-install.txt
#echo "Autolimit 2 bitvise per IP to all port (port 22, 143, 109, 110, 443, 1194, 7300 TCP/UDP)" | tee -a log-install.txt
echo "Auto Lock User Expire tiap jam 00:00" | tee -a log-install.txt
echo "Auto Reboot tiap jam 00:00 dan jam 12:00" | tee -a log-install.txt
echo "" | tee -a log-install.txt

if [[ $vps = "zvur" ]]; then
	echo "ALL SUPPORTED BY D1NFUCK3R" | tee -a log-install.txt
	echo "https://www.facebook.com/beerwaiting/" | tee -a log-install.txt
else
	echo "FACEBOOK GROUP" | tee -a log-install.txt
	echo "https://www.facebook.com/" | tee -a log-install.txt
fi

echo "เรายังมีสคลิป อื่นๆ อีกมากมาย สนใจติดต่อได้ทันที เครดิตที่รับ" | tee -a log-install.txt
echo "Credit to True Wallet & K Mobile Banking Only" | tee -a log-install.txt
echo "Thanks to พี่เทพทุกท่าน ที่เลือกใช้ สคลิป ของเรา.." | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Log Instalasi --> /root/log-install.txt" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "D1NFUCK3R && TOP-GUN !" | tee -a log-install.txt
echo "=======================================================" | tee -a log-install.txt
cd ~/
rm -f /root/debian7.sh
rm -f /root/pptp.sh
rm -f /root/dropbear-2012.55.tar.bz2
rm -rf /root/dropbear-2012.55
rm -f /root/IP
history -c
