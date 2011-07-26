class Team < ActiveRecord::Base
  has_many :profiles
  has_many :users, :through => :profiles
  
  validates_presence_of :name
end
