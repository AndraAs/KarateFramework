Feature: Variables creation in karate framework
    Variables creation in karate framework
    #Variables can be created with Gherkin keyword:
    #<Gherkin Keyword> <def> <Variable_name> = <Value>
    #Variables can be created without Gherkin keyword:
    #* <def> <variable_name> = <value>

    Background: Create and initialize variables
        * def app_name = 'Google'
        * def page_load_timeout = 20

    Scenario: Creating a variable
        #use variable for repeating value
        #the scope of the variables below are for this scenario and can't be accessed outside the scenario
        Given def var_int = 10
        And def var_string = 'Karate'
        Then print "Int Var ==>",var_int
        And print "String Var ==>",var_string
        * def var_int_2 = var_int + 10
        And print "New variable is ==>", var_int_2
        And print "Background var ==>", app_name, page_load_timeout
    #storing the data from an external file
    #we can use variable in matcher expression
    #we can use variables to pass the data from one feature file to another feature file
    Scenario: Creating variables second scenario
        #use variable for repeating value
        #the scope of the variables below are for this scenario and can't be accessed outside the scenario
        Given def var_int = 11
        And def var_string = 'Karate Second scenario'
        Then print "Int Var ==>",var_int
        And print "String Var ==>",var_string
        * def var_int_2 = var_int + 11
        And print "New variable is ==>", var_int_2
        And print "Background var ==>", app_name, page_load_timeout
