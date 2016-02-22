Feature: POST /lists/:list_id/items/:id/completed api endpoint

  As a client
  I want to be able to mark my list item completed/uncompleted

  Background:
    Given user 'Mike' has lists:
      | id |   name |
      |  1 |  todos |
    And 'todos' list has folowing items:
      | id |     body |  completed |
      |  1 | buy eggs |      false |
      |  2 | buy cola |       true |
    And user 'Joe' has lists:
      | id |     name |
      |  2 | wishlist |
    And 'wishlist' list has folowing items:
      | id |     body | completed |
      |  3 | buy milk |     false |

  Scenario: Mike's client marks his list item completed

    Given the client is logged in as 'Mike'
    When the client requests POST /lists/1/items/1/completed
    Then response status should be 200
    And response should be JSON:
      """
      {
        "id": 1,
        "body": "buy eggs",
        "completed": true
      }
      """

  Scenario: Mike's client marks his list item completed

    Given the client is logged in as 'Mike'
    When the client requests POST /lists/1/items/1/completed
    Then response status should be 200
    And response should be JSON:
      """
      {
        "id": 1,
        "body": "buy eggs",
        "completed": true
      }
      """

  Scenario: Mike's client marks his list item uncompleted

    Given the client is logged in as 'Mike'
    When the client requests POST /lists/1/items/2/completed
    Then response status should be 200
    And response should be JSON:
      """
      {
        "id": 2,
        "body": "buy cola",
        "completed": false
      }
      """


  Scenario: Mike's client tries to mark inexistent list item completed

    Given the client is logged in as 'Mike'
    When the client requests POST /lists/1/items/no_such_item/completed
    Then response status should be 404


  Scenario: Mike's client tries to mark item from inexistent list completed

    Given the client is logged in as 'Mike'
    When the client requests POST /lists/no_such_list/items/1/completed
    Then response status should be 404


  Scenario: Mike's client tries to mark item from Joe's list completed

    Given the client is logged in as 'Mike'
    When the client requests POST /lists/2/items/3/completed
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["You are not authorized to perform this action."]
      }
      """


  Scenario: unauthorized client tries to mark list item completed

    When the client requests POST /lists/1/items/1/completed
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["Authorized users only."]
      }
      """