Feature: DELETE /lists/:list_id/items/:id api endpoint

  As a client
  I want to be able to delete items from my lists

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


  Scenario: Mike's client deletes item from his list

    Given the client is logged in as 'Mike'
    When the client requests DELETE /lists/1/items/1
    Then response status should be 204


  Scenario: Mike's client tries to delete item from inexistent list

    Given the client is logged in as 'Mike'
    When the client requests DELETE /lists/no_such_list/items/1
    Then response status should be 404


  Scenario: Mike's client tries to delete inexistent item

    Given the client is logged in as 'Mike'
    When the client requests DELETE /lists/1/items/no_such_item
    Then response status should be 404


  Scenario: Mike's client tries to delete item from Joe's list

    Given the client is logged in as 'Mike'
    When the client requests DELETE /lists/2/items/2
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["You are not authorized to perform this action."]
      }
      """


  Scenario: unauthorized client tries to delete list item

    When the client requests DELETE /lists/1/items/1
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["Authorized users only."]
      }
      """