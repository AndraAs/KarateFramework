Feature: To execute javascript function

To execute javascript function
    Background: Create and initialize base url
      Given url 'http://localhost:9897'

      Scenario: To execute javascript function with or without parameter
      * def getIntValue = function() {return 10;}
      Then print "Function Value", getIntValue()
      * def getRandomValue = function() {return Math.floor((100) * Math.random());}
      Then print "Function value=>", getRandomValue()
      * def getStringValue = function(arg1) {return "Hello " + arg1;}
      Then print "Function value", getStringValue("Andra")