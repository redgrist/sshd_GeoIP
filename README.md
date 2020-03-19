# sshd_GeoIP
How to setup GeoIP to prevent access from other countries then PL 
# install yum, apt
sudo yum install geoip-bin geoip-database
# Centos 8
sudo dnf install GeoIP* geoipupdate
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


# for geoipupdate:
vim /etc/GeoIP.conf

add:

**# GeoIP.conf file - used by geoipupdate program to update databases**
**# from http://www.maxmind.com**
AccountID YOUR_ACCOUNT_ID_HERE

LicenseKey YOUR_LICENSE_KEY_HERE

EditionIDs YOUR_EDITION_IDS_HERE

