class Competition < ActiveRecord::Base
  has_many :problems
  has_many :users
  
  validates :name, :presence => true

  def get_contestants
    return users.where("role_id = ?", 3) # FIXME!!
  end
end
