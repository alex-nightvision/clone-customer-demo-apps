#!/usr/bin/env bash
set -ex

if [ "$(nightvision project list | grep -c $1)" -eq 0 ]; then
	nightvision project create -n $1
	exit
else
	nightvision project set -p $1
fi

# apps
apps="
	testphp
	saddlebagexchange
"

for app in $apps; do
	nightvision app create --name $app
done

# targets
nightvision target create -u "http://testphp.vulnweb.com/" -n "testphp"
nightvision target create -u "https://firing-range.saddlebagexchange.com/" -n "temp-saddlebag-fe-api" --type api --swagger-file "openapi-spec-files/temp-fe-openapi-spec.yml"

# scans
nightvision scan -t testphp -a testphp
nightvision scan -t "temp-saddlebag-fe-api" -a saddlebagexchange