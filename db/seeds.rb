# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'SETTING UP SAMPLE COMPETITION'
competition = Competition.create! :name => "Olimpiada de testeo"
#competition.start

puts 'SETTING UP USER ROLES'
admin_role = Role.create! :name => "administrator"
judge_role = Role.create! :name => "judge"
contestant_role = Role.create! :name => "contestant"


puts 'SETTING UP ADMIN LOGIN'
admin = User.create!(:username => 'admin',
                     :email => 'admin@test.com',
                     :password => 'admin',
                     :role => admin_role,
                     :competition => competition)


puts 'SETTING UP CONTESTANTS'

require 'faker'

i = 1
until i >= 12
  contestant = User.create!(:username => "participante#{i}",
                            :email => "contestant#{i}@test.com",
                            :password => "participante#{i}",
                            :role => contestant_role,
                            :competition => competition)
  contestant.profile.first_name = Faker::Name.first_name
  contestant.profile.last_name = Faker::Name.last_name
  contestant.profile.save
  i = i + 1
end

puts 'SETTING UP JUDGE'
judge = User.create!(:username => 'jurado',
                     :email => 'judge1@test.com',
                     :password => '123456',
                     :role => judge_role,
                     :competition => competition)

puts 'SETTING UP SOME SAMPLE PROBLEMS'
competition.problems.create! :name => "Hola mundo", :description => "Escribir un programa que imprime la cadena 'Hola mundo'."
competition.problems.create!(
    :name => "Suma de dos numeros",
    :description => "Escribir un programa que imprime la suma de 2 + 2."
)
