Feature: GET /lists/:id api endpoint

  As a client
  I want to be able to get my list's info

  Background:
    Given user 'Mike' has lists:
      | id |   name |
      |  1 |  todos |
    And 'todos' list has 1 item
    And user 'Joe' has lists:
      | id |     name |
      |  2 | wishlist |


  Scenario: Mike's client gets Mike's list

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/1
    Then response status should be 200
    And response should be JSON:
      """
      {
        "id": 1,
        "name": "todos",
        "items_count": 1
      }
      """

  Scenario: Mike's client tries to get inexistent list

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/no_such_list
    Then response status should be 404


  Scenario: Mike's client tries to get Joe's list

    Given the client is logged in as 'Mike'
    When the client requests GET /lists/2
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["You are not authorized to perform this action."]
      }
      """


  Scenario: unauthorized client tries to get list

    When the client requests GET /lists/1
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["Authorized users only."]
      }
      """