require 'factory_girl'

Factory.define :competition do |object|
  object.name 'test'
  object.description 'test competition'
  object.status 1
end

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
  u.competition { |c| c.association(:competition) }
  u.role { |role| role.association(:contestant_role) }
end

Factory.define :administrator, :class => User do |u|
  u.username 'test'
  u.email 'user@test.com'
  u.password 'testin'
  u.competition { |c| c.association(:competition) }
  u.role { |role| role.association(:administrator_role) }
end

Factory.define :problem do |object|
  object.name 'test problem'
  object.description 'add two numbers and return the sum'
  object.competition { |c| c.association(:competition) }
end

Factory.define :solution do |object|
  object.problem { |c| c.association(:problem) }
  object.user { |c| c.association(:contestant) }
  object.source_code "puts 'Hello, world'"
end

