Feature: To send the GET request with JWT token

    Scenario: Send the GET request with JWT token
        * def token = call read('../../sharedFeatureFiles/getToken.feature') {password: "Guns and Bikes",username: "John Wick"}
        Given url 'http://localhost:9897/auth/webapi/all'
        And headers {Accept: 'application/json', Authorization: '#("Bearer " + token.authToken)'}
        When method get
        Then status 200

     Scenario: Send the GET request without JWT token
        * def token = call read('../../sharedFeatureFiles/getToken.feature') {password: "Guns and Bikes",username: "John Wick"}
        Given url 'http://localhost:9897/auth/webapi/all'
        And headers {Accept: 'application/json'}
        When method get
        Then status 401