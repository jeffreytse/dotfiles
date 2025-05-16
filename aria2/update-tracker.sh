#!/bin/sh
# More trackers list, see https://github.com/ngosang/trackerslist

tracker_url='https://raw.githubusercontent.com/ngosang/trackerslist/refs/heads/master/trackers_all.txt'
path='http://localhost:6800/jsonrpc'
password=''

tracker=$(echo $(curl -s -L $tracker_url | awk 'NF {printf "%s%s",sep,$0; sep=","} END{print ""}'))

[ -n "$tracker" ] && curl $path -d '{"jsonrpc":"2.0","method":"aria2.changeGlobalOption","id":"cron","params":["token:'$password'",{"bt-tracker":"'$tracker'"}]}'
