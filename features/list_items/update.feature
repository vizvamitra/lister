Feature: PATCH /lists/:list_id/items/:id api endpoint

  As a client
  I want to be able to update my list item

  Background:
    Given user 'Mike' has lists:
      | id |   name |
      |  1 |  todos |
    And 'todos' list has folowing items:
      | id |     body |
      |  1 | buy eggs |
    And user 'Joe' has lists:
      | id |     name |
      |  2 | wishlist |
    And 'wishlist' list has folowing items:
      | id |     body |
      |  2 | buy milk |

  Scenario: Mike's client updates his list item

    Given the client is logged in as 'Mike'
    When the client requests PATCH /lists/1/items/1 sending JSON:
      """
      {
        "item": {
          "body": "sell eggs"
        }
      }
      """
    Then response status should be 200
    And response should be JSON:
      """
      {
        "id": 1,
        "body": "sell eggs"
      }
      """


  Scenario: Mike's client tries to update list item with wrong attributes

    Given the client is logged in as 'Mike'
    When the client requests PATCH /lists/1/items/1 sending JSON:
      """
      {
        "item": {
          "body": ""
        }
      }
      """
    Then response status should be 422
    And response json should have key 'errors' containing a nonempty array


  Scenario: Mike's client tries to update inexistent list item

    Given the client is logged in as 'Mike'
    When the client requests PATCH /lists/1/items/no_such_item sending JSON:
      """
      {
        "item": {
          "body": "sell eggs"
        }
      }
      """
    Then response status should be 404


  Scenario: Mike's client tries to update item from inexistent list

    Given the client is logged in as 'Mike'
    When the client requests PATCH /lists/no_such_list/items/1 sending JSON:
      """
      {
        "item": {
          "body": "sell eggs"
        }
      }
      """
    Then response status should be 404


  Scenario: Mike's client tries to update item from Joe's list

    Given the client is logged in as 'Mike'
    When the client requests PATCH /lists/2/items/2 sending JSON:
      """
      {
        "item": {
          "body": "sell eggs"
        }
      }
      """
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["You are not authorized to perform this action."]
      }
      """


  Scenario: unauthorized client tries to update list item

    When the client requests PATCH /lists/1/items/2 sending JSON:
      """
      {
        "item": {
          "body": "sell eggs"
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