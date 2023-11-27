@Confidence
Feature: To test endpoint with query parameters

     To test endpoint with query parameters

Background: Create and initialize base url
    Given url 'http://localhost:9897'

    Scenario: To get data using query parameters
    # Create the job entry
    * def getJobId = function() {return Math.floor((100) * Math.random());}
    * def jobId = getJobId()
    * def jobTitle = "GO2 Developer"
    * def createJob = call read("../sharedFeatureFiles/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path: '/normal/webapi/add', _jobId:'#(jobId)', _jobTitle:'#(jobTitle)'}
    # Send GET request with query param
    Given path '/normal/webapi/find'
    # And param id = jobId
    # And param jobTitle = jobTitle
    And params {id:'#(jobId)', jobTitle: '#(jobTitle)'}
    And headers {Accept: 'application/json'}
    When method get
    Then status 200
    And match response.jobId == jobId