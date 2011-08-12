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
      "Not executed."
    when 11
      "Compilation error."
    when 12
      "Runtime error."
    when 13
      "Time limit exceeded."
    when 15
      "Success. Everything OK."
    when 17
      "Memory limit exceeded."
    when 19
      "Illegal system call"
    when 20
      "Internal Error. Faulty ideone.com"
    else
      "Oops.."
    end
  end
end
