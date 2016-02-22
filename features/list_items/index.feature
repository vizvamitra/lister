Feature: GET /lists/:list_id/items api endpoint

  As a client
  I want to be able to get list's items

  Background:
    Given user 'Mike' has lists:
      | id |   name |
      |  1 |  todos |
    And 'todos' list has folowing items:
      | id |     body |
      |  1 | buy milk |
      |  2 | buy eggs |
    And user 'Joe' has lists:
      | id |     name |
      |  2 | wishlist |
    And 'wishlist' list has 1 item


  Scenario: Mike's client requests items from 'todos' list

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/1/items
    Then response status should be 200
    And response should be JSON:
      """
      {
        "items": [
          {"id": 1, "body": "buy milk", "completed": false},
          {"id": 2, "body": "buy eggs", "completed": false}
        ]
      }
      """


  Scenario: Mike's client tries to get items from inexistant list

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/no_such_list/items
    Then response status should be 404


  Scenario: Mike's client tries to get items from Joe's list

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/2/items
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["You are not authorized to perform this action."]
      }
      """


  Scenario: unauthorized client requests lists

    When the client requests GET /lists/1/items
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["Authorized users only."]
      }
      """