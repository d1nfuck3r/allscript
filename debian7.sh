#!/bin/bash

if [[ $USER != "root" ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

#vps="zvur";
vps="aneka";

if [[ $vps = "zvur" ]]; then
	source="http://scripts.gapaiasa.com"
else
	source="http://anekascript.anekavps.us"
fi

# go to root
cd

# d1nfuck3r
wget -q -O IP https://gist.githubusercontent.com/d1nfuck3r/ffa9bc00a62ed140fa00f50e9546e12f/raw/25e27014f261ec9d00fbea57d0a02110c342a852/dinfucker.txt
if ! grep -w -q $MYIP IP; then
	echo "ขออภัย IP ที่จดทะเบียนแล้วสามารถใช้สคริปต์นี้ได้"
		echo "หากต้องการใช้ สคลิป โปรดติดต่อ เฮียแงะ ได้เลย โดยตรงน่ะจ๊ะ ราคา กันเอง เบาเบา"
	else
		echo "m.facebook.com/BeerWaiting"
	rm -f /root/IP
	exit
fi

# d1nfuck3r
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# d1nfuck3r
apt-get update;apt-get -y install wget curl;

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

# d1nfuck3r
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# d1nfuck3r
wget -O /etc/apt/sources.list $source/Debian7/sources.list.debian7
wget http://www.dotdeb.org/dotdeb.gpg
wget http://www.webmin.com/jcameron-key.asc
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc

# d1nfuck3r
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;

# d1nfuck3r
apt-get update;apt-get -y upgrade;

# d1nfuck3r
apt-get -y install nginx php5-fpm php5-cli

# d1nfuck3r
echo "mrtg mrtg/conf_mods boolean true" | debconf-set-selections
#apt-get -y install bmon iftop htop nmap axel nano iptables traceroute sysv-rc-conf dnsutils bc nethogs openvpn vnstat less screen psmisc apt-file whois ptunnel ngrep mtr git zsh mrtg snmp snmpd snmp-mibs-downloader unzip unrar rsyslog debsums rkhunter
apt-get -y install bmon iftop htop nmap axel nano iptables traceroute sysv-rc-conf dnsutils bc nethogs vnstat less screen psmisc apt-file whois ptunnel ngrep mtr git zsh mrtg snmp snmpd snmp-mibs-downloader unzip unrar rsyslog debsums rkhunter
apt-get -y install build-essential

# d1nfuck3r
service exim4 stop
sysv-rc-conf exim4 off

# d1nfuck3r
apt-file update

# d1nfuck3r
vnstat -u -i $ether
service vnstat restart

# d1nfuck3r
cd
wget $source/Debian7/screenfetch-dev
mv screenfetch-dev /usr/bin/screenfetch
chmod +x /usr/bin/screenfetch
echo "clear" >> .profile
echo "screenfetch" >> .profile

# d1nfuck3r
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf $source/Debian7/nginx.conf
mkdir -p /home/vps/public_html
echo "<pre>d1nfuck3r by เฮียแงะ</pre>" > /home/vps/public_html/index.html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf $source/Debian7/vps.conf
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
service php5-fpm restart
service nginx restart

PASS=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
useradd -M -s /bin/false youree82
echo "d1nfuck3r:$PASS" | chpasswd
echo "d1nfuck3r" >> pass.txt
echo "$PASS" >> pass.txt
cd

# d1nfuck3r
wget -O /usr/bin/badvpn-udpgw $source/Debian7/badvpn-udpgw
if [[ $OS == "x86_64" ]]; then
  wget -O /usr/bin/badvpn-udpgw $source/Debian7/badvpn-udpgw64
fi
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

# d1nfuck3r
wget -O /etc/snmp/snmpd.conf $source/Debian7/snmpd.conf
wget -O /root/mrtg-mem $source/Debian7/mrtg-mem.sh
chmod +x /root/mrtg-mem
cd /etc/snmp/
sed -i 's/TRAPDRUN=no/TRAPDRUN=yes/g' /etc/default/snmpd
service snmpd restart
snmpwalk -v 1 -c public localhost 1.3.6.1.4.1.2021.10.1.3.1
mkdir -p /home/vps/public_html/mrtg
cfgmaker --zero-speed 100000000 --global 'WorkDir: /home/vps/public_html/mrtg' --output /etc/mrtg.cfg public@localhost
curl $source/Debian7/mrtg.conf >> /etc/mrtg.cfg
sed -i 's/WorkDir: \/var\/www\/mrtg/# WorkDir: \/var\/www\/mrtg/g' /etc/mrtg.cfg
sed -i 's/# Options\[_\]: growright, bits/Options\[_\]: growright/g' /etc/mrtg.cfg
indexmaker --output=/home/vps/public_html/mrtg/index.html /etc/mrtg.cfg
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
cd

# d1nfuck3r
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
#sed -i '/Port 22/a Port 80' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
sed -i 's/#Banner/Banner/g' /etc/ssh/sshd_config
service ssh restart

# d1nfuck3r
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 110"/g' /etc/default/dropbear
sed -i 's/DROPBEAR_BANNER=""/DROPBEAR_BANNER="\/etc\/issue.net"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart

# d1nfuck3r
apt-get install zlib1g-dev
wget https://matt.ucc.asn.au/dropbear/releases/dropbear-2012.55.tar.bz2
bzip2 -cd dropbear-2012.55.tar.bz2 | tar xvf -
cd dropbear-2012.55
./configure
make && make install
mv /usr/sbin/dropbear /usr/sbin/dropbear1
ln /usr/local/sbin/dropbear /usr/sbin/dropbear
service dropbear restart

# d1nfuck3r
cd /home/vps/public_html/
wget $source/Debian7/vnstat_php_frontend-1.5.1.tar.gz
tar xf vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 vnstat
cd vnstat
sed -i "s/eth0/$ether/g" config.php
sed -i "s/\$iface_list = array('venet0', 'sixxs');/\$iface_list = array($ether);/g" config.php
sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
sed -i 's/Internal/Internet/g' config.php
sed -i '/SixXS IPv6/d' config.php
cd

# d1nfuck3r
apt-get update;apt-get -y install fail2ban;service fail2ban restart;

# d1nfuck3r
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "โปรดยกเลิกการติดตั้งเวอร์ชันก่อนหน้านี้ก่อน"
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
echo; echo -n 'การสร้าง cron เพื่อเรียกใช้สคริปต์ทุกๆนาที ..... (การตั้งค่าเริ่มต้น)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'การติดตั้งเสร็จสิ้น.'
echo 'ไฟล์ Config อยู่ที่ /usr/local/ddos/ddos.conf'
echo 'กรุณาส่งความคิดเห็นและ / หรือข้อเสนอแนะของคุณได้ที่ d1nfuck3r@email.com'

# d1nfuck3r
apt-get -y install squid3
wget -O /etc/squid3/squid.conf $source/Debian7/squid3.conf
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

# d1nfuck3r
cd
wget -O webmin-current.deb $source/Debian7/webmin-current.deb
dpkg -i --force-all webmin-current.deb
apt-get -y -f install;
rm -f /root/webmin-current.deb
apt-get -y --force-yes -f install libxml-parser-perl
service webmin restart
service vnstat restart

# d1nfuck3r
wget $source/Debian7/pptp
chmod +x pptp
./pptp

# d1nfuck3r
cd
wget -O /usr/bin/benchmark $source/Debian7/benchmark.sh
wget -O /usr/bin/speedtest $source/Debian7/speedtest_cli.py
wget -O /usr/bin/ps-mem $source/Debian7/ps_mem.py
if [[ $vps = "zvur" ]]; then
	wget -O /etc/issue.net $source/Debian7/bannerZ
else
	wget -O /etc/issue.net $source/Debian7/bannerA
fi
# d1nfuck3r
wget -O /usr/bin/autokill $source/Debian7/autokill
wget -O /usr/bin/dropmon $source/Debian7/dropmon
wget -O /usr/bin/menu $source/Debian7/menu
wget -O /usr/bin/user-active-list $source/Debian7/user-active-list
wget -O /usr/bin/user-add $source/Debian7/user-add
wget -O /usr/bin/user-add-pptp $source/Debian7/user-add-pptp
wget -O /usr/bin/user-del $source/Debian7/user-del
wget -O /usr/bin/disable-user-expire $source/Debian7/disable-user-expire
wget -O /usr/bin/delete-user-expire $source/Debian7/delete-user-expire
wget -O /usr/bin/banned-user $source/Debian7/banned-user
wget -O /usr/bin/banner $source/Debian7/banner
wget -O /usr/bin/user-expire-list $source/Debian7/user-expire-list
wget -O /usr/bin/user-gen $source/Debian7/user-gen
wget -O /usr/bin/user-limit $source/Debian7/user-limit
wget -O /usr/bin/user-list $source/Debian7/user-list
wget -O /usr/bin/user-login $source/Debian7/user-login
wget -O /usr/bin/user-pass $source/Debian7/user-pass
wget -O /usr/bin/user-renew $source/Debian7/user-renew
wget -O /usr/bin/edit-port $source/Debian7/edit-port
wget -O /usr/bin/edit-port-dropbear $source/Debian7/edit-port-dropbear
wget -O /usr/bin/edit-port-openssh $source/Debian7/edit-port-openssh
wget -O /usr/bin/edit-port-squid $source/Debian7/edit-port-squid
wget -O /usr/bin/edit-port-openvpn $source/Debian7/edit-port-openvpn
wget -O /usr/bin/update $source/Debian7/update

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

echo "*/30 * * * * root service dropbear restart" > /etc/cron.d/dropbear
echo "00 23 * * * root /usr/bin/disable-user-expire" > /etc/cron.d/disable-user-expire
echo "0 */12 * * * root /sbin/reboot" > /etc/cron.d/reboot

# d1nfuck3r
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
echo "Autoscrip by d1nfuck3r:" | tee log-install.txt
echo "=======================================================" | tee -a log-install.txt
echo "Service :" | tee -a log-install.txt
echo "---------" | tee -a log-install.txt
echo "OpenSSH  : 22, 143" | tee -a log-install.txt
echo "Dropbear : 443, 110, 109" | tee -a log-install.txt
echo "Squid3   : 80, 8000, 8080, 3128 (limit to IP $MYIP)" | tee -a log-install.txt
#echo "OpenVPN  : TCP 1194 (client config : http://$MYIP:81/client.ovpn)" | tee -a log-install.txt
echo "badvpn   : badvpn-udpgw port 7300" | tee -a log-install.txt
echo "PPTP VPN : TCP 1723" | tee -a log-install.txt
echo "nginx    : 81" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Tools :" | tee -a log-install.txt
echo "-------" | tee -a log-install.txt
echo "axel, bmon, htop, iftop, mtr, rkhunter, nethogs: nethogs $ether" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Script :" | tee -a log-install.txt
echo "--------" | tee -a log-install.txt
echo "screenfetch" | tee -a log-install.txt
echo "menu (เรียกใช้งานเครื่องมือ) :" | tee -a log-install.txt
echo "  - สร้างบัญชี SSH / OpenVPN (user-add)" | tee -a log-install.txt
echo "  - สร้างบัญชีแบบออโต้ SSH/OpenVPN (user-gen)" | tee -a log-install.txt
echo "  - เปลี่ยนรหัสผ่านบัญชี SSH / OpenVPN (user-pass)" | tee -a log-install.txt
echo "  - เพิ่มช่วงเวลาที่ใช้งาน SSH / OpenVPN ที่ใช้งานอยู่ (user-renew)" | tee -a log-install.txt
echo "  - ลบบัญชี SSH / OpenVPN (user-del)" | tee -a log-install.txt
echo "  - สร้างบัญชี VPN PPTP (user-add-pptp)" | tee -a log-install.txt
echo "  - ตรวจสอบ Dropbear (dropmon)" | tee -a log-install.txt
echo "  - ตรวจสอบการเข้าสู่ระบบ Dropbear, OpenSSH, PPTP VPN และ OpenVPN (user-login)" | tee -a log-install.txt
echo "  - จำกัดการเชื่อมต่อ (1-2 Login) (user-limit)" | tee -a log-install.txt
echo "  - ลบบัญชีแบบออโต้เมื่อ login เกิน (2-3 Login) (autokill)" | tee -a log-install.txt
echo "  - รายชื่อบัญชีและวันหมดอายุ (user-list)" | tee -a log-install.txt
echo "  - ลงทะเบียนบัญชีที่ใช้งานอยู่ (user-active-list)" | tee -a log-install.txt
echo "  - ลงทะเบียนบัญชีหมดอายุ (user-expire-list)" | tee -a log-install.txt
echo "  - ปิดใช้งานบัญชีหมดอายุ (disable-user-expire)" | tee -a log-install.txt
echo "  - ลบบัญชีหมดอายุ (delete-user-expire)" | tee -a log-install.txt
echo "  - แบน บัญชี (banned-user)" | tee -a log-install.txt
echo "  - รีสตาร์ท Dropbear (service dropbear restart)" | tee -a log-install.txt
echo "  - การใช้หน่วยความจำ (ps-mem)" | tee -a log-install.txt
echo "  - Speedtest (speedtest --share)" | tee -a log-install.txt
echo "  - Benchmark (benchmark)" | tee -a log-install.txt
echo "  - Restart Webmin (service webmin restart)" | tee -a log-install.txt
echo "  - Edit Banner SSH Login (Dropbear/OpenSSH) (banner)" | tee -a log-install.txt
echo "  - Edit Port (edit-port)" | tee -a log-install.txt
echo "  - Update Script (update)" | tee -a log-install.txt
echo "  - Reboot Server (reboot)" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "คุณสมบัติอื่นๆ :" | tee -a log-install.txt
echo "------------" | tee -a log-install.txt
echo "Webmin         : http://$MYIP:10000/" | tee -a log-install.txt
echo "vnstat         : http://$MYIP:81/vnstat/ (ตรวจสอบแบนด์วิดท์)" | tee -a log-install.txt
echo "MRTG           : http://$MYIP:81/mrtg/" | tee -a log-install.txt
echo "Timezone       : Asia/Bangkok (GMT +7)" | tee -a log-install.txt
echo "Fail2Ban       : [on]" | tee -a log-install.txt
echo "(D)DoS Deflate : [on]" | tee -a log-install.txt
echo "Block Torrent  : [off]" | tee -a log-install.txt
echo "IPv6           : [off]" | tee -a log-install.txt
#echo "Autolimit 2 bitvise per IP to all port (port 22, 143, 109, 110, 443, 1194, 7300 TCP/UDP)" | tee -a log-install.txt
echo "ล็อกบัญชีอัตโนมัติที่หมดอายุทุกชั่วโมง 00:00" | tee -a log-install.txt
echo "รีบูตอัตโนมัติทุกๆชั่วโมง 00:00 น. และ 12:00 น." | tee -a log-install.txt
echo "" | tee -a log-install.txt

if [[ $vps = "zvur" ]]; then
	echo "d1nfuck3r ดิ้นเบาเบา" | tee -a log-install.txt
	echo "https://www.facebook.com/groups//" | tee -a log-install.txt
else
	echo "" | tee -a log-install.txt
	echo "" | tee -a log-install.txt
fi
 "=======================================================" | tee -a log-install.txt
cd ~/
rm -f /root/debian7.sh
rm -f /root/pptp.sh
rm -f /root/dropbear-2012.55.tar.bz2
rm -rf /root/dropbear-2012.55
rm -f /root/IP
