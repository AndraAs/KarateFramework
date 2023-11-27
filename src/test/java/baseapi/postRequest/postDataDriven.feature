Feature: Data driven functionality

    Feature for data driven functionality

@setup
Scenario: Read the csv data
  * def testData = read('../utils/testData/jobAddData.csv')

    Scenario Outline: Using data driven functionality with <method>
        Given print '<url>'
        And print '<path>'
        When print '<method>'
        Then print '<status>'

        Examples:
            | url                   | path               | method | status |
            | http://localhost:9897 | /normal/webapi/add | post   | 201    |
            | http://localhost:9897 | /normal/webapi/all | get    | 200    |

    Scenario Outline: Data driven job description entry
        Given url 'http://localhost:9897'
        And path '/normal/webapi/add'
        * def body = read("../requestSchemas/postSchemaAddJobDataDriven.json")
        And request body
        And headers {Accept : "application/json", Content-Type: "application/json"}
        When method post
        Then status <status>

        Examples:
            | jobId | jobTitle            | jobDescription          | status |
            | 9980  | Solutions Architect | Architecture consulting | 201    |
            | id    | Solutions Architect | Architecture consulting | 400    |
            | false | Solutions Architect | Architecture consulting | 400    |

    Scenario Outline: Data driven job description entry using csv file
        Given url 'http://localhost:9897'
        And path '/normal/webapi/add'
        * def body = read("../requestSchemas/postSchemaAddJobDataDriven.json")
        And request body
        And headers {Accept : "application/json", Content-Type: "application/json"}
        When method post
        Then status <status>

        Examples:
            # | read('../utils/testData/jobAddData.csv') |
            | karate.setup().testData |
            