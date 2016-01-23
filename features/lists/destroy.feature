Feature: DELETE /lists/:id api endpoint

  As a client
  I want to be able to delete my list

  Background:
    Given user 'Mike' has lists:
      | id |   name |
      |  1 |  todos |
    And user 'Joe' has lists:
      | id |     name |
      |  2 | wishlist |

  Scenario: Mike's client deletes list

    Given the client is logged in as 'Mike'
    When the client requests DELETE /lists/1
    Then response status should be 204


  Scenario: Mike's client tries to delete inexistent list

    Given the client is logged in as 'Mike'
    When the client requests DELETE /lists/no_such_list
    Then response status should be 404


  Scenario: Mike's client tries to delete Joe's list

    Given the client is logged in as 'Mike'
    When the client requests DELETE /lists/2
    Then response status should be 404


  Scenario: unauthorized client tries to delete list

    When the client requests DELETE /lists/1
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["Authorized users only."]
      }
      """