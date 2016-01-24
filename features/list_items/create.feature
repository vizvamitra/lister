Feature: POST /lists/:list_id/items api endpoint

  As a client
  I want to be able to create new list item

  Background:
    Given user 'Mike' has lists:
      | id |  name |
      |  1 | todos |
    And user 'Joe' has lists:
      | id |     name |
      |  2 | wishlist |

  Scenario: Mike's client adds new item to his list

    Given the client is logged in as 'Mike'
    And last created 'list item' has id 100
    When the client requests POST /lists/1/items sending JSON:
      """
      {
        "item": {
          "body": "buy milk"
        }
      }
      """
    Then response status should be 201
    And response should be JSON:
      """
      {
        "id": 101,
        "body": "buy milk"
      }
      """


  Scenario: Mike's client tries to add new item in Joe's list

    Given the client is logged in as 'Mike'
    When the client requests POST /lists/2/items sending JSON:
      """
      {
        "item": {
          "body": "buy milk"
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


  Scenario: Mike's client tries to add new item in inexistant list

    Given the client is logged in as 'Mike'
    When the client requests POST /lists/no_such_list/items sending JSON:
      """
      {
        "item": {
          "body": "buy milk"
        }
      }
      """
    Then response status should be 404


  Scenario Outline: Mike's client tries to create new list item with wrong attributes

    Given the client is logged in as 'Mike'
    When the client requests POST /lists/1/items sending JSON:
      """
      {
        "item": {
          "<ATTRIBUTE>": <VALUE>
        }
      }
      """
    Then response status should be 422
    And response json should have key 'errors' containing a nonempty array

      Examples:
        |  ATTRIBUTE | VALUE |
        |       body |    "" |
        | wrong_attr | "any" |


  Scenario: unauthorized client tries to create new list item

    When the client requests POST /lists/1/items sending JSON:
      """
      {
        "item": {
          "body": "todos"
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