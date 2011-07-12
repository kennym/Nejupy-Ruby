class Role < ActiveRecord::Base
  has_many :users

  attr_accessible :name
  
  validates_uniqueness_of :name
end
