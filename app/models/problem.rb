class Problem < ActiveRecord::Base
  belongs_to :competition
  has_many :solutions
  has_many :programming_languages
  has_many :users, :through => :solutions

  validates_presence_of :competition
  
  # Asserts that problem has a solution from given contestant
  def solved_by?(contestant)
    if solutions.where(:user_id => contestant).empty?
      return false # not solved
    else
      return true # solved
    end
  end

  def get_solution_for(contestant)
    return solutions.where(:user_id => contestant).first
  end
  
  # Return a hash from all programming languages assigned to the
  # problem.
  def programming_languages
    # FIXME:
    {
      "I18n".t(:choose_programming_language) =>  nil,
    }.update(@programming_languages)
  end

end
