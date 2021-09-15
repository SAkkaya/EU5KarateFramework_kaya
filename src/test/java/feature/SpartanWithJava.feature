Feature: karate Java Integration

  Background:
    * def spartanUrl = 'http://3.87.241.127:8000'

  Scenario: Get a spartan with request header
    Given url spartanUrl
    And path "api/spartans"
#    header i api de authorization key gondermistik
    And header Accept = 'application/json'
    When method GET
    Then status 200


  Scenario: Create a new spartan
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
  """
     {
        "name": "Lorenza",
        "gender": "Female",
        "phone": 3123781237
    }
    """
    When method POST
    Then status 201
    And print response


  @wip
  Scenario: reading java methods
    #point the class that we want to run
    #Java.type --> used to connect to java class

  * def SpartanDataGenerator = Java.type('utilities.SpartanDataGenerator')
  * def newSpartan = SpartanDataGenerator.createSpartan()
    # run the static method in that class and capture the result
    # the result map object is represented as a json
  * print newSpartan





