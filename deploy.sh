#!/usr/bin/env bash
set -ex

if [ "$(nightvision project list | grep -c $1)" -eq 0 ]; then
	nightvision project create -n $1
else
	nightvision project set -p $1
fi

# apps
apps="vulndjangoplay
xssfastapi
testinvicti-api
demo-testfire
testasp
testphp
testsparker
public-firing-range
javaspringvulny-api
saddlebag-exchange
webgoatnet
flaskSimpleExample"

for app in $apps; do
	nightvision app create --name $app
done

# targets
nightvision target create -u "http://vulndjangoplay.nvtest.io:8020/polls/" -n "vulndjangoplay"
nightvision target create -u "http://xssfastapi.nvtest.io:8000/" -n "xssfastapi"
nightvision target create -u "http://demo.testfire.net/" -n "demo-testfire"
nightvision target create -u "http://testasp.vulnweb.com/" -n "testasp"
nightvision target create -u "http://testphp.vulnweb.com/" -n "testphp"
nightvision target create -u "http://php.testsparker.com/" -n "testsparker-php"
nightvision target create -u "http://aspnet.testsparker.com/" -n "testsparker-aspnet"
nightvision target create -u "https://public-firing-range.appspot.com/" -n "public-firing-range"
nightvision target create -u "https://firing-range.saddlebagexchange.com/" -n "temp-saddlebag-fe"
nightvision target create -u "https://staging.saddlebag-with-pockets.pages.dev/" -n "staging-fe-react"

nightvision target create -u "http://localhost:8999" -n "webgoatnet"
nightvision target create -u "http://127.0.0.1:8081/" -n "flaskSimpleExample" --type api  --swagger-file "openapi-spec-files/flaskSimpleExample.yml"
nightvision target create -u "http://127.0.0.1:8020/" -n "vulndjangoplay-local" --type api  --swagger-file "openapi-spec-files/vulndjangoplay.yml"

nightvision target create -u "https://javaspringvulny.nvtest.io:9000/" -n "javaspringvulny-public-api" --type api --swagger-file "openapi-spec-files/javaspringvulny-openapi-spec.yml"
nightvision target create -u "https://localhost:9000" -n "javaspringvulny-api" --type api --swagger-file "openapi-spec-files/javaspringvulny-openapi-spec-local.yml"
nightvision target create -u "https://staging.saddlebagexchange.com/" -n "staging-wow" --type api --swagger-file "openapi-spec-files/wow-openapi-spec.yml"
nightvision target create -u "https://staging.saddlebagexchange.com/" -n "staging-ffxiv" --type api --swagger-file "openapi-spec-files/ffxiv-openapi-spec.yml"
nightvision target create -u "https://firing-range.saddlebagexchange.com/" -n "temp-saddlebag-fe-api" --type api --swagger-file "openapi-spec-files/temp-fe-openapi-spec.yml"
nightvision target create -u "http://rest.testinvicti.com/jwt" -n "testinvicti-api" --type api --swagger-file "openapi-spec-files/testinvicti-api-jwt.yml"

# auth
nightvision auth headers create \
	-n "testinvicti-api" \
	--headers "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6InNlY3JldC50eHQifQ.eyJ1c2VyIjoidGVzdCJ9.jqBFzyBB68KWiOvEJhcaDgMY0Gea-t0KNnf-fR2Ioyc"

# http://aspnet.testsparker.com
echo "PLEASE LOG IN WITH THESE CREDENTIALS -" && echo "alan@turing.com" && echo "theturingtest"
nightvision auth playwright create -u "http://aspnet.testsparker.com/" -n "testsparker-asp"

# http://php.testsparker.com
echo "PLEASE LOG IN WITH THESE CREDENTIALS - " && echo "admin" && echo "admin123456"
nightvision auth playwright create -u "http://php.testsparker.com/" -n "testsparker-php"

# http://testphp.vulnweb.com/
echo "PLEASE LOG IN WITH THESE CREDENTIALS - " && echo "test" && echo "test"
nightvision auth playwright create -u "http://testphp.vulnweb.com/" -n "testphp"

# http://demo.testfire.net
echo "PLEASE LOG IN WITH THESE CREDENTIALS -  " && echo "admin" && echo "admin"
nightvision auth playwright create -u "http://demo.testfire.net/" -n "demo-testfire"

# https://javaspringvulny.nvtest.io:9000/
echo "PLEASE LOG IN WITH THESE CREDENTIALS: " && echo "user" && echo "password"
nightvision auth playwright create -u "https://javaspringvulny.nvtest.io:9000/" -n "javaspringvulny-public-api"

# https://localhost:9000
echo "PLEASE LOG IN WITH THESE CREDENTIALS: " && echo "user" && echo "password"
nightvision auth playwright create -u "https://localhost:9000" -n "javaspringvulny-api"
