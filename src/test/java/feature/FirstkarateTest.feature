Feature: welcome to karate

  @wip
  Scenario: how to print
    Given print "Hello World"
    When print 'another print'
    Then print 'then print'
  @wip
  Scenario: more printing
    Given print 'Some words to print'
    * print 'my name is ','karate kid'
      #, is using for concat
    * print '2+2=',(2+2)

  @wip
  Scenario: variables
    * def name = 'Mike'
    * print 'my name is ' + name
    * def age = 20
    * print name, 'is', age, 'years old'


    @wip
    Scenario: difficult



