# This object represents the programming language.
#
# You can assign many programming languages to a problem, and vice-versa
class ProgrammingLanguage < ActiveRecord::Base
  belongs_to :problem
end
