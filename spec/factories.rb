require 'factory_girl'

Factory.define :contestant_role, :class => Role do |object|
  object.name 'contestant'
end

Factory.define :administrator_role, :class => Role do |object|
  object.name 'administrator'
end

Factory.define :contestant, :class => User do |u|
  u.username 'test'
  u.email 'user@test.com'
  u.password 'testin'
  u.competition Competition.first
  u.role { |role| role.association(:contestant_role) }
end

Factory.define :administrator, :class => User do |u|
  u.username 'test'
  u.email 'user@test.com'
  u.password 'testin'
  u.competition Competition.first
  u.role { |role| role.association(:administrator_role) }
end

Factory.define :competition do |object|
  object.name 'test'
  object.description 'test competition'
end

Factory.define :problem do |object|
  object.name 'test problem'
  object.description 'add two numbers and return the sum'
  object.competition Competition.first
end
