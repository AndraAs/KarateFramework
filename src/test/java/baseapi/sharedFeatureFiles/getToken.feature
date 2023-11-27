@ignore
Feature: To get the JWT token for the user

    Get JWT Token for user

    Scenario: Register the user and generate the token
    #Register the user
    Given url 'http://localhost:9897/users/sign-up'
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    And request {password: '#(password)',username: '#(username)'}
    When method post
    Then status 200

    #Get the token
    Given url 'http://localhost:9897/users/authenticate'
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    And request {password: '#(password)',username: '#(username)'}
    When method post
    Then status 200
    * def authToken = response.token

