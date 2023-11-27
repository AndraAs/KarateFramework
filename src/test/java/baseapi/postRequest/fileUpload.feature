Feature: To upload a file using karate framework

    To upload a file using karate framework

    Background: Setup base path
        Given url 'http://localhost:9897'

    Scenario: To upload file
        Given path '/normal/webapi/upload'
        * def fileLocation = '../utils/testData/fileUpload.txt'
        And multipart file file = {read: '#(fileLocation)', filename: 'fileUpload.txt', Content-type: 'multipart/form-data'}
        When method POST
        Then status 200
        And print response
        And match response.message contains 'fileUpload.txt'