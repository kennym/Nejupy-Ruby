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

puts 'CREATING PROGRAMMING LANGUAGES'

ProgrammingLanguage.create!(:name => "SQL",
                            :ideone_id => "40",
                            :compiler => "")
ProgrammingLanguage.create!(:name => "C",
                            :ideone_id => "11",
                            :compiler => "gcc-4.3.4")
ProgrammingLanguage.create!(:name => "C++",
                            :ideone_id => "1",
                            :compiler => "gcc-4.3.4")
ProgrammingLanguage.create!(:name => "C++0x",
                            :ideone_id => "44",
                            :compiler => "gcc-4.5.1")
ProgrammingLanguage.create!(:name => "C99 strict",
                            :ideone_id => "34",
                            :compiler => "gcc-4.3.4")
ProgrammingLanguage.create!(:name => "Java",
                            :ideone_id => "10",
                            :compiler => "sun-jdk-1.6.0.17")
ProgrammingLanguage.create!(:name => "PHP",
                            :ideone_id => "29",
                            :compiler => "php 5.2.11")
ProgrammingLanguage.create!(:name => "Pascal (FreePascal)",
                            :ideone_id => "22",
                            :compiler => "fpc 2.2.0")
ProgrammingLanguage.create!(:name => "Pascal",
                            :ideone_id => "2",
                            :compiler => "gpc 20070904")
ProgrammingLanguage.create!(:name => "Python 2",
                            :ideone_id => "4",
                            :compiler => "python 2.6.4")
ProgrammingLanguage.create!(:name => "Python 3",
                            :ideone_id => "116",
                            :compiler => "python-3.1.2")
ProgrammingLanguage.create!(:name => "Ruby",
                            :ideone_id => "17",
                            :compiler => "ruby-1.9.2")
