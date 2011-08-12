class SolutionDetail < ActiveRecord::Base
  belongs_to :solution
  
  validates_presence_of :status
  validates_presence_of :result
  validates_presence_of :public
  validates_presence_of :exec_time

  def result
    result = read_attribute(:result)
    case result
    when 0
      I18n.t(:not_executed)
    when 11
      I18n.t(:compilation_error)
    when 12
      I18n.t(:runtime_error)
    when 13
      I18n.t(:time_limit_exceeded)
    when 15
      I18n.t(:success)
    when 17
      I18n.t(:memory_limit_exceeded)
    when 19
      I18n.t(:illegal_system_call)
    when 20
      I18n.t(:internal_error)
    else
      "Oops.."
    end
  end
end
