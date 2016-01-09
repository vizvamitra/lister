Given(/^the client is logged in as '([^']+)'$/) do |user_name|
  email = User.find_by(name: user_name).email
  password = FactoryGirl.attributes_for(:user)[:password]
  post '/auth/sign_in', email: email, password: password
  @auth_headers = last_response.original_headers.
    slice('client', 'access-token', 'token-type', 'expiry', 'uid').
    symbolize_keys!
end

When(/^the client requests (#{CAPTURE_HTTP_METHOD}) \/([^\s]*)$/) do |method, path|
  @auth_headers ||= {}
  send(method, path, **@auth_headers)
end

When(/^the client requests (#{CAPTURE_HTTP_METHOD}) \/([^\s]*) sending JSON:$/) do |method, path, json|
  @auth_headers ||= {}
  send(method, path, **@auth_headers, **json.symbolize_keys!)
end