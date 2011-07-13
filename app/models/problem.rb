class Problem < ActiveRecord::Base
  belongs_to :competition
  has_many :solutions

  def solved_by?(user)
    # TODO:
    false
  end
end
