require 'factory_girl'

Factory.define :user do |u|
  u.username 'test'
  u.email 'user@test.com'
  u.password 'testin'
end
