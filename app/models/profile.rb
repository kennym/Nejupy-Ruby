class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  def full_name
    return first_name.to_s + " " + last_name.to_s
  end
end
