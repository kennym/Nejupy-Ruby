# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'SETTING UP SAMPLE COMPETITION'
competition = Competition.create! :name => "Test"

puts 'SETTING UP USER ROLES'
admin_role = Role.create! :name => "administrator"
judge_role = Role.create! :name => "judge"
contestant_role = Role.create! :name => "contestant"
idiot_role = Role.create! :name => "idiot"

puts 'SETTING UP ADMIN LOGIN'
admin = User.create! :username => 'admin', :email => 'admin@test.com', :password => 'admin', :role => admin_role, :competition => competition
contestant = User.create! :username => 'contestant', :email => 'contestant@test.com', :password => 'contestant', :role => contestant_role, :competition => competition
idiot = User.create! :username => 'idiot', :email => 'idiot@test.com', :password => 'idiot', :role => idiot_role, :competition => competition

puts 'SETTING UP SOME SAMPLE PROBLEMS'
problem_1 = competition.problems.create! :name => "Test", :description => "Test"
problem_1 = competition.problems.create! :name => "Sum of two numbers", :description => "Return the sum of two numbers"
