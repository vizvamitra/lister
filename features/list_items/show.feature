Feature: GET /lists/:list_id/items/:id api endpoint

  As a client
  I want to be able to get my item's info

  Background:
    Given user 'Mike' has lists:
      | id |   name |
      |  1 |  todos |
    And 'todos' list has folowing items:
      | id |     body |
      |  1 | buy milk |
    And user 'Joe' has lists:
      | id |     name |
      |  2 | wishlist |
    And 'wishlist' list has folowing items:
      | id |     body |
      |  2 | buy eggs |


  Scenario: Mike's client gets Mike's list item

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/1/items/1
    Then response status should be 200
    And response should be JSON:
      """
      {
        "id": 1,
        "body": "buy milk",
        "completed": false
      }
      """

  Scenario: Mike's client tries to get inexistent item

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/1/items/no_such_item
    Then response status should be 404


  Scenario: Mike's client tries to get item from inexistent list

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/no_such_item/items/5
    Then response status should be 404


  Scenario: Mike's client tries to get item from Joe's list

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/2/items/2
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["You are not authorized to perform this action."]
      }
      """


  Scenario: unauthorized client tries to get list item

    When the client requests GET /lists/1/items/1
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["Authorized users only."]
      }
      """