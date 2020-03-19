#!/bin/bash
# License: WTFPL
# UPPERCASE space-separated country codes to ACCEPT example "PL US"
ALLOW_COUNTRIES="PL"
LOGDENY_FACILITY="authpriv.notice"

if [ $# -ne 1 ]; then
  echo "Usage:  `basename $0` " 1>&2
  exit 0 # return true in case of config issue
fi

if [[ "`echo $1 | grep ':'`" != "" ]] ; then
  COUNTRY=`/usr/bin/geoiplookup6 "$1" | awk -F ": " '{ print $2 }' | awk -F "," '{ print $1 }' | head -n 1`
else
  COUNTRY=`/usr/bin/geoiplookup "$1" | awk -F ": " '{ print $2 }' | awk -F "," '{ print $1 }' | head -n 1`
fi
[[ $COUNTRY = "IP Address not found" || $ALLOW_COUNTRIES =~ $COUNTRY ]] && RESPONSE="ALLOW" || RESPONSE="DENY"

if [[ "$RESPONSE" == "ALLOW" ]] ; then
  logger -p $LOGDENY_FACILITY "$RESPONSE sshd connection from $1 ($COUNTRY)"
  exit 0
else
  logger -p $LOGDENY_FACILITY "$RESPONSE sshd connection from $1 ($COUNTRY)"
  exit 1
fi