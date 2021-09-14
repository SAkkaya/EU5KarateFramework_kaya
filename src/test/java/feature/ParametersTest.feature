Feature: Parameters examples

  Background:
#    Given url 'http://api.exchangeratesapi.io'
    * def baseUrl = 'http://api.exchangeratesapi.io'
    * def spartanUrl = 'http://3.87.241.127:8000'
    * def hrUrl = 'http://3.87.241.127:1000/ords/hr'


  Scenario: path parameters
    Given url baseUrl
    And path "latest?access_key=466c5621538288db882a6d1091d4f0b7"
#    And path "/latest?access_key=466c5621538288db882a6d1091d4f0b7"
    When method get
    Then status 200



  Scenario: path parameters with Date
    Given url baseUrl
    And path "2010-01-12?access_key=466c5621538288db882a6d1091d4f0b7"
#    And path "/2010-01-12?access_key=466c5621538288db882a6d1091d4f0b7"
    When method get
    Then status 200

  Scenario: get all spartans with path
    Given url spartanUrl
    And path "api/spartans"
    When method get
    Then status 200
    And print response


  Scenario: get one spartans only

    * def expectedSpartan =
  """
    {
        "gender": "Female",
        "phone": 3312820936,
        "name": "Lorenza",
        "id": 10
    }
    """
    Given url spartanUrl
    And path "api/spartans"
    And path "10"
    When method get
    Then status 200
    And print response
#    And match response == {"gender": "Female","phone": 3312820936,"name": "Lorenza","id": 10 }
    And match response == expectedSpartan



  Scenario:  query parameters
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    When method GET
    Then status 200
    #And match header Content-Type contains 'application/json'
    And match header Content-Type == 'application/json'
    And print response

      #verify each content has gender = Female
    And match each response.content contains {"gender":"Female"}
      #second way of iteration
    And match each response.content[*].gender == 'Female'
    And match response.content[0].name == 'Jaimie'
      #verify each content phone is number
    And match each response.content[*].phone == '#number'

    * print  response.content[0].gender
    * print "Gender " , each response.content


  @wip
  Scenario: hr regions example
    Given url hrUrl
    And path 'regions'
    When method GET
    Then status 200
     * print response
    And match response.limit == 25
    And match each response.items[*].region_id == '#number'
