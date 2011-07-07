class Competition < ActiveRecord::Base
  validates :name, :presence => true
end
