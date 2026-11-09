@ignore
Feature: Todos API mock

  Background:
    * def todos = {}

  Scenario: pathMatches('/todos') && methodIs('post')
    * def todo = request
    * todo.id = '' + (karate.sizeOf(todos) + 1)
    * todo.done = false
    * todos[todo.id] = todo
    * def response = todo
    * def responseStatus = 201

  Scenario: pathMatches('/todos/{id}') && methodIs('get')
    * def todo = todos[pathParams.id]
    * def response = todo ? todo : { error: 'not found' }
    * def responseStatus = todo ? 200 : 404

  Scenario: pathMatches('/todos/{id}') && methodIs('put')
    * def todo = todos[pathParams.id]
    * if (todo) todos[pathParams.id] = karate.merge(todo, request)
    * def response = todo ? todos[pathParams.id] : { error: 'not found' }
    * def responseStatus = todo ? 200 : 404

  Scenario: pathMatches('/todos') && methodIs('get')
    * def response = karate.valuesOf(todos)
