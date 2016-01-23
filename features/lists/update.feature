Feature: PATCH /lists/:id api endpoint

  As a client
  I want to be able to update my list

  Background:
    Given user 'Mike' has lists:
      | id |   name |
      |  1 |  todos |
    And user 'Joe' has lists:
      | id |     name |
      |  2 | wishlist |

  Scenario: Mike's client updates list

    Given the client is logged in as 'Mike'
    When the client requests PATCH /lists/1 sending JSON:
      """
      {
        "list": {
          "name": "wishes"
        }
      }
      """
    Then response status should be 200
    And response should be JSON:
      """
      {
        "id": 1,
        "name": "wishes",
        "items_count": 0
      }
      """


  Scenario: Mike's client tries to update list with wrong attributes

    Given the client is logged in as 'Mike'
    When the client requests PATCH /lists/1 sending JSON:
      """
      {
        "list": {
          "name": ""
        }
      }
      """
    Then response status should be 422
    And response json should have key 'errors' containing a nonempty array


  Scenario: Mike's client tries to update inexistent list

    Given the client is logged in as 'Mike'
    When the client requests PATCH /lists/no_such_list sending JSON:
      """
      {
        "list": {
          "name": "wishes"
        }
      }
      """
    Then response status should be 404


  Scenario: Mike's client tries to update Joe's list

    Given the client is logged in as 'Mike'
    When the client requests PATCH /lists/2 sending JSON:
      """
      {
        "list": {
          "name": "wishes"
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


  Scenario: unauthorized client tries to update list

    When the client requests PATCH /lists/1 sending JSON:
      """
      {
        "list": {
          "name": "wishes"
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