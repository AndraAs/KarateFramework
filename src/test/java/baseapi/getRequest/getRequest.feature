@Sanity
Feature: Test endpoint of application
    Testing different get endpointd with different data format

Background: Setup base path
Given url _url
And print '======================'

    Scenario: GET all data from application in JSON format
        Given path '/normal/webapi/all'
        And header Accept = 'application/json'
        When method GET 
        Then status 200

    Scenario: GET all data from application in JSON format
        Given path '/normal/webapi/all'
        And header Accept = 'application/xml'
        When method GET 
        Then status 200