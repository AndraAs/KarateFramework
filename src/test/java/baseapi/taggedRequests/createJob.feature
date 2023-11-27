Feature: To create the job entry in the app
    Use POST url to create job entry in app

    Background: Initialize base url
        Given url 'http://localhost:9897'

    Scenario: POST request to create job entry in JSON format
        Given path '/normal/webapi/add'
        * def body = read("../requestSchemas/postSchemaAddJob.json")
        And request body
        And headers {Accept : "application/json", Content-Type: "application/json"}
        When method POST
        And status 201
        And print "RESPONSE ==>", response
        And match response.jobTitle == 'Platform Engineer2'

    Scenario: POST request to create job entry using XML request body format
        Given path '/normal/webapi/add'
        And request 
        And headers {Accept : "application/json", Content-Type: "application/xml"}
        When method POST
        And status 201
        And print "RESPONSE ==>", response
        And match response.jobId == 21
    @Confidence
     Scenario: POST request to create job entry using XML request body format and receive the response in XML
        Given path '/normal/webapi/add'
        * def body = read("../requestSchemas/postSchemaAddJob.xml")
        And request body
        And headers {Accept : "application/xml", Content-Type: "application/xml"}
        When method POST
        And status 201
        And print "RESPONSE ==>", response
        And match response/Job/jobId == '21'