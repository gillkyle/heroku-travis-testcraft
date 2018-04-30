#!/bin/bash
echo "Starting Heroku post build TestCraft tests..."

node_modules/.bin/tc-cli run -u user@ravndev.com -t 728D36A01A874D4F874D18490CA78865 -s "Heroku Build Fail" -e Testing -p Beynd > tc-cli-result.txt

results=`cat tc-cli-result.txt`
runResults="Result: reportTestSuiteStart: Heroku Build Fail reportTestStart: New spec - broken - New spec - New spec data'] reportTestFinishFailure:New spec - broken - New spec - New spec data' message='{\"message\":\"Expected \'https://test-beynd-web-client.herokuapp.com/app/projects\' to equal \'https://test-beynd-web-client.herokuapp.com/app/projects_failing_intentionally\'.\",\"metaData\":{\"componentInstanceId\":\"1923474\",\"testId\":\"1933423\",\"testdataId\":\"1933424\",\"uuid\":\"6b158041-dff4-4243-9d78-b28f6ccf17aa-1933423\",\"usecaseId\":\"1933422\",\"versionId\":\"1923473\",\"flowElementId\":\"6b158041-dff4-4243-9d78-b28f6ccf17aa\",\"actionName\":\"checkURL\",\"scriptOffset\":1,\"stepOffset\":6}}'] reportTestSuiteFinish: Heroku Build Fail"
echo $results
if [[ $results =~ "Failure" ]]; then
	echo "TestCraft tests failed"
	exit 0
else
	echo "TestCraft tests passed"
	exit 1
fi