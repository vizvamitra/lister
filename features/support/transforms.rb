CAPTURE_JSON = Transform /^\s*[{\[].*[}\]]\s*$/m do |json_string|
  JSON.parse(json_string)
end

CAPTURE_HTTP_METHOD = Transform /^GET|POST|PATCH|DELETE$/ do |method|
  method.downcase.to_sym
end

CAPTURE_INT = Transform /^\d+$/ do |integer_string|
  integer_string.to_i
end