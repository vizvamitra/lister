shared_context 'devise', type: :controller do
  before(:each){ @request.env["devise.mapping"] = Devise.mappings[:user] }
end

module AuthHelpers
  def auth_request(user)
    sign_in user
    request.headers.merge!(user.create_new_auth_token)
  end
end

RSpec.configure do |config|
  config.include(Devise::TestHelpers, type: :controller)
  config.include(AuthHelpers, type: :controller)
end