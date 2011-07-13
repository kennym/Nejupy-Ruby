class Solution < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user

  validates :user, :presence => true
  validates :problem, :presence => true
  validates :source_code, :presence => true
  # TODO:
  #validates :programming_language, :presence => true
end
