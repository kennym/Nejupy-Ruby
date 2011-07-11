class Solution < ActiveRecord::Base
  belongs_to :participant
  belongs_to :problem

  validates :source_code, :presence => true
  # TODO:
  #validates :programming_language, :presence => true
end
