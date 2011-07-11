class Problem < ActiveRecord::Base
  belongs_to :competition
  has_many :solutions
end
