# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'SETTING UP ADMIN LOGIN'
User.create! :username => 'admin', :email => 'admin@test.com', :password => 'admin', :password_confirmation => 'admin'

puts 'SETTING UP USER ROLES'
Role.create! :name => "Administrator"
Role.create! :name => "Judge"
Role.create! :name => "Contestant"
