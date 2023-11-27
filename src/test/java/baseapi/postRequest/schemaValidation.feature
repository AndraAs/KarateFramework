Feature: Validate the json schema

To validate the JSON schema for POST request
    Background: Create and initialize base url
      Given url 'http://localhost:9897'

      Scenario: To validate json schema
      Given path '/normal/webapi/add'
      * def body = read("../requestSchemas/postSchemaAddJob.json")
      And request body
      And headers {Accept: 'application/json', Content-Type: application/json}
      When method POST
      And status 201
      And match response ==
      """
      {
    "jobId": '#number',
    "jobTitle": '#string',
    "jobDescription": '#string',
    "experience": '#[] #string',
    "project": '#[] #object'
}
      """
    