# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'SETTING UP USER ROLES'
admin_role = Role.create! :name => "Administrator"
judge_role = Role.create! :name => "Judge"
contestant_role = Role.create! :name => "Contestant"

puts 'SETTING UP ADMIN LOGIN'
admin = User.create! :username => 'admin', :email => 'admin@test.com', :password => 'admin', :password_confirmation => 'admin'
admin.role = admin_role

