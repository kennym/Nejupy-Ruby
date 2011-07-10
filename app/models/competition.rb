class Competition < ActiveRecord::Base
  has_many :problems
  has_many :users
  
  validates :name, :presence => true
end
