#!/bin/bash

# apps
apps="vulndjangoplay
xssfastapi
testsparker-api
demo-testfire
testasp
testphp
public-firing-range
javaspringvulny-api
saddlebag-exchange"

for app in $apps; do
	nightvision create app -n $app;
done

# targets
nightvision target create -u https://staging.saddlebag-with-pockets.pages.dev/ -n staging-fe-react
nightvision target create -u https://javaspringvulny.nvtest.io:9000/ -n javaspringvulny-public-api --type api --swagger-file 
nightvision target create -u https://staging.saddlebagexchange.com/ -n staging-wow --type api --swagger-file 
nightvision target create -u https://staging.saddlebagexchange.com/ -n staging-ffxiv --type api --swagger-file 
nightvision target create -u http://vulndjangoplay.nvtest.io:8020/polls/ -n vulndjangoplay
nightvision target create -u http://xssfastapi.nvtest.io:8000/ -n xssfastapi
nightvision target create -u http://rest.testinvicti.com/jwt -n testsparker-api --type api --swagger-file 
nightvision target create -u http://demo.testfire.net/ -n demo-testfire
nightvision target create -u http://testasp.vulnweb.com/ -n testasp
nightvision target create -u http://testphp.vulnweb.com/ -n testphp
nightvision target create -u https://public-firing-range.appspot.com/ -n public-firing-range
nightvision target create -u https://localhost:9000 -n javaspringvulny-api --type api --swagger-file 
nightvision target create -u https://firing-range.saddlebagexchange.com/ -n temp-saddlebag-fe-api --type api --swagger-file 
nightvision target create -u https://firing-range.saddlebagexchange.com/ -n temp-saddlebag-fe

# api files


# auth
