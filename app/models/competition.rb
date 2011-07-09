class Competition < ActiveRecord::Base
  has_many :problems
  
  validates :name, :presence => true
end
