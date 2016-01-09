Then(/^response should be JSON:$/) do |expected_json|
  json = JSON.parse(last_response.body)
  expect(json).to match(expected_json)
end

Then(/^response status should be (#{CAPTURE_INT})$/) do |status|
  expect( last_response.status ).to eq status
end

Then(/^response json should have key '([^']+)' containing a nonempty array$/) do |key_name|
  response_json = JSON.parse(last_response.body)
  expect( response_json[key_name] ).to be_a Array
  expect( response_json[key_name].size ).to be > 0
end