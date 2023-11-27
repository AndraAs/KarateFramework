@Sanity
Feature: Create job entry in test app
    Helper file for POST and PUT requests

Scenario: Create job entry with json data
        Given url _url
        And path _path
        # * def getJobId = function() {return Math.floor((100) * Math.random());}
        # * def jobId = getJobId()
        * def body = read("../requestSchemas/postSchemaAddJobCallAnotherFeature.json")
        And request body
        And headers {Accept : "application/json", Content-Type: "application/json"}
        When method POST
        Then status 201
        * def responseJobId = response.jobId
        * def responseJobTitle = response.jobTitle