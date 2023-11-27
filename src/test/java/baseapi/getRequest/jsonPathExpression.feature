Feature: To use the json path expression

    To use the json path expression

Background: Setup base path
    Given url 'http://localhost:9897'

Scenario: To get the property values using json path expressions
    Given path '/normal/webapi/all'
    When method GET 
    Then status 200
    * def jobId = 10
    * def jobTitle = karate.jsonPath(response, "$[?(@.jobId == " + jobId + ")].jobTitle")
    * def jobDescription = karate.jsonPath(response, "$[?(@.jobId == 1)].jobDescription")
    * def experience = karate.jsonPath(response, "$[?(@.jobId == 1)].experience")
    And print "JOB TITLE =>" , jobTitle
    And print "JOB DESCRIPTION=>", jobDescription
    And print "EXPERIENCE =>", experience
