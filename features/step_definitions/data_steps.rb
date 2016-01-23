Given(/^user '([^']+)' has lists:$/) do |user_name, table|
  user = create(:user, name: user_name)
  user.confirm
  table.hashes.each do |list_attributes|
    create(:list, user: user, **list_attributes.symbolize_keys!)
  end
end

Given(/^'([^']+)' list has folowing items:$/) do |list_name, table|
  list = List.find_by(name: list_name)
  table.hashes.each do |item_attributes|
    create(:list_item, list: list, **item_attributes.symbolize_keys!)
  end
end

Given(/^'([^']+)' list has (\d+) items?$/) do |list_name, number|
  list = List.find_by(name: list_name)
  create_list(:list_item, number, list: list)
end

Given(/^user '([^']+)'$/) do |user_name|
  create(:user, name: user_name).confirm
end

Given(/^last created '([^']+)' has id (\d+)$/) do |model_string, counter_state|
  model = model_string.gsub(' ', '_').classify.constantize
  model.connection.execute <<-SQL
    ALTER SEQUENCE #{model.table_name}_id_seq RESTART WITH #{counter_state + 1}
  SQL
end