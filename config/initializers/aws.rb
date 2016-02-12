if Rails.env.production?
  ses_config = Rails.application.secrets.amazon['ses']
  ENV['AWS_ACCESS_KEY_ID'] = ses_config['access_key_id']
  ENV['AWS_SECRET_ACCESS_KEY'] = ses_config['secret_access_key']
  ENV['AWS_REGION'] = ses_config['region']

  Aws.config[:log_level] = :info
end