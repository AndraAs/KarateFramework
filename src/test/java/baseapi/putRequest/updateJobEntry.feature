Feature: Feature for updating a job

    Feature for updating a job
Background: Initialize base url
    Given url 'http://localhost:9897'

    Scenario: To update job entry for existing job in JSON format
    # #Create new job entry
    #     Given path '/normal/webapi/add'
    #     * def getJobId = function() {return Math.floor((100) * Math.random());}
    #     * def jobId = getJobId()
    #     * def body = read("../requestSchemas/postSchemaAddJob.json")
    #     And request body
    #     And headers {Accept : "application/json", Content-Type: "application/json"}
    #     When method POST
    #     Then status 201
    # #PUT request
    #     Given path '/normal/webapi/update'
    #     * def body = read("../requestSchemas/updateJobBody.json")
    #     And request body
    #     And headers {Accept : "application/json", Content-Type: "application/json"}
    #     When method PUT
    #     Then status 200
    #     * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + jobId + ")].project")
    #     And match projectArray[0] == '#[2]'

        #  #PUT request by calling another feature file for initial job creation
        # Given call read("../sharedFeatureFiles/createJobEntry.feature")
        # Given path '/normal/webapi/update'
        # * def body = read("../requestSchemas/updateJobBodyForCallAnotherFeature.json")
        # And request body
        # And headers {Accept : "application/json", Content-Type: "application/json"}
        # When method PUT
        # Then status 200
        # * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 125)].project")
        # And match projectArray[0] == '#[2]'

         #PUT request by calling another feature file for initial job creation with variables
        * def getJobId = function() {return Math.floor((100) * Math.random());}
        * def jobId = getJobId()
        * def postRequest = call read("../sharedFeatureFiles/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path: '/normal/webapi/add', _jobId:'#(jobId)'}
        Given path '/normal/webapi/update'
        * def body = read("../requestSchemas/updateJobBodyForCallAnotherFeature.json")
        And request body
        And headers {Accept : "application/json", Content-Type: "application/json"}
        When method PUT
        Then status 200
        * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + jobId + ")].project")
        And match projectArray[0] == '#[2]'
