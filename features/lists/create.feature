Feature: POST /lists api endpoint

  As a client
  I want to be able to create new list

  Background:
    Given user 'Mike'

  Scenario: Mike's client creates new list

    Given the client is logged in as 'Mike'
    And last created 'list' has id 100
    When the client requests POST /lists sending JSON:
      """
      {
        "list": {
          "name": "todos"
        }
      }
      """
    Then response status should be 201
    And response should be JSON:
      """
      {
        "id": 101,
        "name": "todos",
        "items_count": 0,
        "items": []
      }
      """


  Scenario Outline: Mike's client tries to create new list with wrong attributes

    Given the client is logged in as 'Mike'
    When the client requests POST /lists sending JSON:
      """
      {
        "list": {
          "<ATTRIBUTE>": <VALUE>
        }
      }
      """
    Then response status should be 422
    And response json should have key 'errors' containing a nonempty array

      Examples:
        |  ATTRIBUTE | VALUE |
        |       name |    "" |
        | wrong_attr | "any" |


  Scenario: unauthorized client tries to create new list

    When the client requests POST /lists sending JSON:
      """
      {
        "list": {
          "name": "todos"
        }
      }
      """
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["Authorized users only."]
      }
      """