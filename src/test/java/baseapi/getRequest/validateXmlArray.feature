Feature: Validate XML body
    Validate XML body

Background: Setup base path
Given url 'http://localhost:9897'

    Scenario: Validate XML body
        Given path '/normal/webapi/all'
        And header Accept = 'application/xml'
        When method GET 
        Then status 200
        And match response/List/item/jobId == '1'
        And match response/List/item/jobTitle == 'Software Engg'
        And match response/List/item/experience/experience[1] == 'Google'
        And match response/List/item/project/project/projectName == 'Movie App'
        And match response/List/item/project/project/technology/technology[1] == 'Kotlin'
        # The above can be written with skipping the response keyword
        And match /List/item/project/project/technology/technology[2] == 'SQL Lite'
        #Traverse xml similar to json by using the dot operator. In this case array index starts from 0
        And match response.List.item.project.project.technology.technology[2] == 'Gradle'

     Scenario: Validate XML body using fuzzy matchers
        Given path '/normal/webapi/all'
        And header Accept = 'application/xml'
        When method GET 
        Then status 200
        And match response/List/item/jobId == '#notnull'
        And match response/List/item/jobTitle == '#string'
        And match response/List/item/experience/experience[1] == '#notnull'
        And match response/List/item/project/project/projectName == '#present'
        And match response/List/item/project/project/technology/technology[1] == '#ignore'
        And match response/List/item/jobTitle == '#string? _.length ==13'
        And match response/List/item/jobTitleId == '#notpresent'


        