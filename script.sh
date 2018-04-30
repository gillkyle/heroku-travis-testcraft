#!/usr/local/bin/bash
#enter your tc-cli command which contain > tc-cli run --user <User Name> --token <Token> --environment <Environment> --testsuite <TestSuite Name> --ciprovider <CI Provider Name>
# and then run the bash file from the command ./script or add in to the post deployment in heroku to recive the exit code 0 or 1

node_modules/.bin/tc-cli run -u user@ravndev.com -t 728D36A01A874D4F874D18490CA78865 -s "Heroku Build Fail" -e Testing -p Beynd > tc-cli-result.txt

runResults="$(tail -3 tc-cli-result.txt | head -1 | cut -d " " -f 2)"
echo "${runResults::-1}"
runResults="${runResults::-1}"
if [ $runResults = "Failed" ]; then
	echo "1, the tests failed"
	exit 1
else
	echo "0, the tests passed"
	exit 0
fi
