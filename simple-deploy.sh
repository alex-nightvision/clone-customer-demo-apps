#!/usr/bin/env bash
set -ex

if [ "$(nightvision project list | grep -c $1)" -eq 0 ]; then
	nightvision project create -n $1 || true
	exit
else
	nightvision project set -p $1 || true
fi

# apps
apps="
	testphp
"

for app in $apps; do
	nightvision app create --name $app
done

# targets
nightvision target create -u "http://testphp.vulnweb.com/" -n "testphp" || true
# scans
nightvision scan -t testphp -a testphp & || true
