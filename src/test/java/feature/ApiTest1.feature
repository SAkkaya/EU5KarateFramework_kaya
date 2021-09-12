Feature: exchange rate api tests

  Scenario: basic test with status code validation
    Given url 'http://api.exchangeratesapi.io/latest?access_key=466c5621538288db882a6d1091d4f0b7'
    When method GET
    Then status 200

  Scenario: get rates for specific day
    Given url 'http://api.exchangeratesapi.io/2010-01-12?access_key=466c5621538288db882a6d1091d4f0b7'
    When method GET
    Then status 200
    # And match header Content-Type contains 'application/json'
    And match header Content-Type == 'application/json; Charset=UTF-8'
    And match header Connection == 'keep-alive'
    # to verify headers we use header keyword then headername without double or single code
    # and == 'header value'
     # how can we verify header is there or not
    And match header Date == '#present'
    # this equals to headers().hasHeaderWithName("headername") in restassured

  @wip
  Scenario: json body verification
    Given url 'http://api.exchangeratesapi.io/2010-01-12?access_key=466c5621538288db882a6d1091d4f0b7'
    When method get
    Then status 200
    And match header Content-Type == 'application/json; Charset=UTF-8'
    And print response
    And print response.base
    # verify base is EUR
    And match response.base == 'EUR'
    And print response.rates
    And print response.rates.USD
     # verify existing of rate of USD
    And match response.rates.USD == '#present'
    And match response.rates.USD == 1.449908








