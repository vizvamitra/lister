Feature: GET /lists api endpoint

  As a client
  I want to be able to get list of lists

  Background:
    Given user 'Mike' has lists:
      | id |   name |
      |  1 |  todos |
      |  2 | wishes |

  Scenario: Mike's client requests his lists

    Given the client is logged in as 'Mike'
    When the client requests GET /lists
    Then response status should be 200
    And response should be JSON:
      """
      {
        "lists": [
          {"id": 1, "name": "todos"},
          {"id": 2, "name": "wishes"}
        ]
      }
      """

  Scenario: unauthorized client requests lists

    When the client requests GET /lists
    Then response status should be 401
    And response should be JSON:
      """
      {
        "errors": ["Authorized users only."]
      }
      """