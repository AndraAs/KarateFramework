Feature: To access the secure get endpoint with Basic Auth

Background: Setup the base path
    Given url 'http://localhost:9897'

Scenario: To access the GET endpoint with basic auth
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'Basic YWRtaW46d2VsY29tZQ=='}
    When method get
    Then status 200
    And match response == '#notnull'

Scenario: To access the GET endpoint with basic auth without passing Authorization
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json'}
    When method get
    Then status 401
    And match response == '#notnull'

Scenario: To access the GET endpoint with non existent user
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization:'Basic YWRtaW5BbmRyYTp3ZWxjb21lMQ=='}
    When method get
    Then status 401

Scenario: To access the GET endpoint with basic auth via js function
    Given path '/secure/webapi/all'
    * def credentials = { username: 'admin', password: 'welcome' }
    * def auth = call read('../../utils/basicAuth.js') credentials
    And print "Encoded string ", auth
    And headers {Accept:'application/json', Authorization:'#(auth)'}
    When method get
    Then status 200
    And match response == '#notnull'