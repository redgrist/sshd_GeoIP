# sshd_GeoIP
How to setup GeoIP to prevent access from other countries then PL 
# install dnf, yum, apt
sudo dnf install geoip-bin geoip-database
# create file sh
vim /usr/local/bin/ipfilter.sh
# chmod
chmod +x /usr/local/bin/ipfilter.sh
# /etc/hosts.deny add:
sshd: ALL
# /etc/hosts.allow add:
sshd: ALL: aclexec /usr/local/bin/ipfilter.sh %a
# GeoIP fresh data download
https://www.miyuru.lk/geoiplegacy
# File ipv4: 
https://dl.miyuru.lk/geoip/maxmind/country/maxmind4.dat.gz
# gunzip and put file: 
cd /usr/share/GeoIP/
as GeoIP.dat
