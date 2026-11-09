Feature: Todos API

  Background:
    * def server = karate.start({ mock: 'todos-mock.feature', port: 0 })
    * url server.url

  Scenario: Create, complete and list a todo
    Given path 'todos'
    And request { title: 'Write the first test' }
    When method post
    Then status 201
    And match response == { id: '#string', title: 'Write the first test', done: false }
    * def id = response.id

    Given path 'todos', id
    And request { done: true }
    When method put
    Then status 200
    And match response.done == true

    Given path 'todos'
    When method get
    Then status 200
    And match response contains { id: '#(id)', title: 'Write the first test', done: true }

  Scenario: An unknown todo is not found
    Given path 'todos', 'missing'
    When method get
    Then status 404
