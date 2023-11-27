Feature: Validate JSON body
    Validate JSON body

Background: Setup base path
Given url 'http://localhost:9897'

    Scenario: Validate JSON body
        Given path '/normal/webapi/all'
        And header Accept = 'application/json'
        When method GET 
        Then status 200
        And match response.[0].jobId == 1
        And match response.[0].project[0].projectName == 'Movie App'
        And match response.[0].project[0].technology[2] == 'Gradle'
        #validate array size
        And match response[0].project[0].technology == '#[3]'
        # wild card character *
        # the expression will return all the values present in array including the order
        And match response.[0].project[0].technology[*] contains 'Gradle'
        And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
        And match response.[*].jobId contains 1

    
    Scenario: Validate JSON body using fuzzy matchers
        Given path '/normal/webapi/all'
        And header Accept = 'application/json'
        When method GET 
        Then status 200
        #validate property is present irrespective of its value
        And match response.[0].jobId == '#present'
        #validate property value is not null
        And match response.[0].project[0].projectName == '#notnull'
        #ignore property 
        And match response.[0].project[0].technology[2] == '#ignore'
        #validate property value is in array
        And match response[0].project[0].technology == '#array'
        # validate value type
        And match response.[0].jobTitle == '#string'
        And match response.[0].jobId == '#number'
        #complex fuzzy matcher, if expression returns true, test passes, if returns false, it fails
        And match response.[0].jobId == '#? _ == 1'
        And match response.[0].jobId == '#? _ >= 1'
        #validate that the value of jobTitle property should be string and the length of the string should be >=1
        And match response.[0].jobTitle == '#string? _.length ==13'
        #validate property should be of type array
        And match response.[0].experience == '#[]'
        #validate property should be of type array and specify size
        And match response.[0].experience == '#[3]'
        #validate property should be an array of strings
        And match response.[0].experience == '#[] #string'
        #validate property should be an array of size 3 and every entry in array is of type string
        And match response.[0].experience == '#[3] #string'
        #validate property should be an array of size 3 and every entry in array is of type string and every string length should be greater than 2
        And match response.[0].experience == '#[3] #string? _.length >2'


