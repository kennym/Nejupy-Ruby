require 'factory_girl'

Factory.define :user do |u|
  u.username 'test'
  u.email 'user@test.com'
  u.password 'testin'
end

Factory.define :competition do |object|
  object.name 'test'
  object.description 'test competition'
end

Factory.define :problem do |object|
  object.name 'test problem'
  object.description 'add two numbers and return the sum'
  object.competition_id :competition
end
