class Competition < ActiveRecord::Base
  has_many :problems
  has_many :users
  
  validates :name, :presence => true

  # Ideally this should be a class variable, but then it won't be
  # accessible from outside the class.
  def statuses
    statuses = {
      "Not started" => 1,
      "In Progress" => 2,
      "Finished" => 3
    }
    return statuses
  end

  # Start competition
  def start
    if !self.start_time and self.status == 1
      self.start_time = DateTime.current
      self.status = self.statuses["In Progress"]
      save()
    end
  end

  def end
    if !self.end_time and self.status == 2
      self.end_time = DateTime.current
      self.status = self.statuses["Finished"]
      save()
    end
  end

  def get_contestants
    return users.where("role_id = ?", 3) # FIXME!!
  end
end
