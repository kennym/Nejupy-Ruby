class SolutionDetail < ActiveRecord::Base
  belongs_to :solution
  
  validates_presence_of :status
  validates_presence_of :result
  validates_presence_of :public
  validates_presence_of :exec_time
end
