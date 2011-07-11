class Solution < ActiveRecord::Base
  belongs_to :problem
  has_one :user

  validates :user, :presence => true
  validates :problem, :presence => true
  validates :source_code, :presence => true
  # TODO:
  #validates :programming_language, :presence => true
end
