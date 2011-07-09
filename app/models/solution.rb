class Solution < ActiveRecord::Base
  belongs_to :participant
  belongs_to :problem

end
