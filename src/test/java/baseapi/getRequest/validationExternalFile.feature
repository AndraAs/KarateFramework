Feature: Validate GET response from external file
    To validate GET endpoint response using external file
    Background: Setu the base url
        Given url 'http://localhost:9897'

    Scenario: To get the data in JSON format and validate from file
        Given path '/normal/webapi/all'
        And header Accept = 'application/json'
        When method GET
        Then status 200
        #Create a var to store the data from external json file
        * def actualResponse = read("../responseSchemas/getSchemaValidation.json")
        And print "JSON File ==>", actualResponse
        And match response == actualResponse

    Scenario: To get the data in XML format and validate from file
        Given path '/normal/webapi/all'
        And header Accept = 'application/xml'
        When method GET
        Then status 200
        #Create a var to store the data from external xml file
        * def actualResponse = read("../responseSchemas/getSchemaValidation.xml")
        And print "XML File ==>", actualResponse
        And match response == actualResponse
