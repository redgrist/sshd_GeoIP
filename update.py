#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import requests
import gzip
import os
import shutil

url = "https://dl.miyuru.lk/geoip/maxmind/country/maxmind4.dat.gz"
tdir = "/usr/share/GeoIP/"
filen = "maxmind4.dat.gz"
fdat = "GeoIP.dat"

print("downloading: "+filen , "from "+url)
os.chdir(tdir)
myfile = requests.get(url, allow_redirects=True)
open(filen, 'wb').write(myfile.content)

print("decompress: "+filen)

input = gzip.GzipFile(filen , 'rb')
s = input.read()
input.close()
output = open(fdat , 'wb')
output.write(s)
output.close()

print("removing gz file: "+ filen)
path = os.getcwd()
print(path)

os.remove(filen)

print("done")