@configTag
Feature: Access variables set by karate-config.js file

    Background: To get the value of myVarName
        * def localMyVarName = myVarName
        Given print "Background variable value ==> ", localMyVarName

    Scenario: Get username and password from karate-config.js
        * def localUsername = username
        Given print "Scenario variable value ==> ", localUsername
        And print "Scenario variable value ==> ", password