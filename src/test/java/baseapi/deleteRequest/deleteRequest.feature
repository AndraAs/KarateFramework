Feature: To delete a job resource

    To delete a job resource

    Background: Create and initialize base url
        Given url 'http://localhost:9897'

    Scenario: To delete a job resource
        # Create a new job entry
        * def getJobId = function() {return Math.floor((100) * Math.random());}
        * def jobId = getJobId()
        * def jobTitle = "Java Developer2"
        * def createJob = call read("../sharedFeatureFiles/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path: '/normal/webapi/add', _jobId:'#(jobId)', _jobTitle:'#(jobTitle)'}
        # Delete newly created job entry
        Given path '/normal/webapi/remove/' + jobId
        And headers {Accept: 'application/json'}
        When method delete
        Then status 200
        # Get request with query param and validate for 404
        Given path '/normal/webapi/find'
        And params {id:'#(jobId)', jobTitle:'#(jobTitle)'}
        And header Accept = 'application/json'
        When method get
        Then status 404

    Scenario: To do request chaining
        # Create new job entry
        * def getJobId = function() {return Math.floor((100) * Math.random());}
        * def jobId = getJobId()
        * def jobTitle = "New job title"
        * def createJob = call read("../sharedFeatureFiles/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path: '/normal/webapi/add', _jobId:'#(jobId)', _jobTitle:'#(jobTitle)'}
        # Extract the job id and job title from the response of post request
        * def jobIdPost = createJob.responseJobId
        * def jobTitlePost = createJob.responseJobTitle
        # Send the patch request, value of query param will be set by info extracted from previous request
        * def updatedJD = 'Even newer job description'
        Given path '/normal/webapi/update/details'
        And params {id:'#(jobIdPost)',jobTitle:'#(jobTitlePost)',jobDescription:'#(updatedJD)'}
        And headers {Accept: 'application/json'}
        When method patch
        Then status 200
        # Extract jobId and jobtitle from patch request response
        * def jobIdPatch = response.jobId
        * def jobTitlePatch = response.jobTitle
        # get request with query params, value of query param is set by info extracted from response of patch request
        Given path '/normal/webapi/find'
        And params {id:'#(jobIdPatch)',jobTitle:'#(jobTitlePatch)'}
        And headers {Accept: 'application/json'}
        When method get
        Then status 200
        # Add the validation on job description in response of get request
        And match response.jobDescription == updatedJD

