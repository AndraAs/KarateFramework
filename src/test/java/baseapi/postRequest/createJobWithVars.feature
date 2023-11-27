Feature: To create the job entry in the app with variables
    Use POST url to create job entry in app with variables

    Background: Initialize base url
        Given url 'http://localhost:9897'

    Scenario: POST request to create job entry in JSON format with variables
        Given path '/normal/webapi/add'
        * def getJobId = function() {return Math.floor((100) * Math.random());}
        * def jobId = getJobId()
        * def body = read("../requestSchemas/postSchemaAddJob.json")
        And request body
        And headers {Accept : "application/json", Content-Type: "application/json"}
        When method POST
        And status 201
        And print "RESPONSE ==>", response
        And match response.jobTitle == 'Platform Engineer2'
        And match response.jobId == '#(jobId)'

    Scenario: GET all job entries in JSON format with embedded variables
        Given path '/normal/webapi/all'
        And headers {Accept : "application/json"}
        When method GET
        Then status 200
        * def projectSchema = {"projectName": '#string', "technology": '#[] #string'}
        * def mainSchema = {"jobId": '#number', "jobTitle": '#string', "jobDescription": '#string', "experience": '#[] #string', "project": '#[] ##(projectSchema)'}
        And match response ==
            """
            '#[] ##(mainSchema)'
            """

    Scenario: GET all job entries in JSON format with embedded variables from external json file
        Given path '/normal/webapi/all'
        And headers {Accept : "application/json"}
        When method GET
        Then status 200
        * def mainSchema = read("../responseSchemas/getSchemaValidationEmbeddedVars.json") 
        And print "SCHEMA=>", mainSchema
        And match response == '#[] ##(mainSchema)'
          


