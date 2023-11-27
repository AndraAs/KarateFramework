Feature: To test the patch/update of a job description

    To test the patch/update of a job description

Background: Create and initialize base url
    Given url 'http://localhost:9897'
@Smoke
Scenario: To test the patch/update of a job description
# Create job entry
  * def getJobId = function() {return Math.floor((100) * Math.random());}
  * def jobId = getJobId()
  * def jobTitle = "Java Developer"
  * def createJob = call read("../sharedFeatureFiles/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path: '/normal/webapi/add', _jobId:'#(jobId)', _jobTitle:'#(jobTitle)'}
  * def updatedJobDescription = 'automated patch update'
# Update job entry by patch request
    Given path '/normal/webapi/update/details'
    And params {id:'#(jobId)', jobTitle: '#(jobTitle)', jobDescription: '#(updatedJobDescription)'}
    And headers {Accept: 'application/json'}
    And request {}
    When method patch
    Then status 200
    And match response.jobDescription == updatedJobDescription
@Smoke
Scenario: To test the patch/update of a job description with non-existing jobId
# Create job entry
  * def getJobId = function() {return Math.floor((100) * Math.random());}
  * def jobId = getJobId()
  * def jobTitle = "Java Developer2"
  * def createJob = call read("../sharedFeatureFiles/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path: '/normal/webapi/add', _jobId:'#(jobId)', _jobTitle:'#(jobTitle)'}
  * def updatedJobDescription = 'automated patch update'
# Update job entry by patch request
    Given path '/normal/webapi/update/details'
    And params {id:'-1', jobTitle: '#(jobTitle)', jobDescription: '#(updatedJobDescription)'}
    And headers {Accept: 'application/json'}
    And request {}
    When method patch
    Then status 404
    And match response.message == "Failed to find job with id=-1"