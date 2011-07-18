class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role?("administrator")
      can :access, :rails_admin
      can :manage, :all
    elsif user.role?("contestant")
      cannot :access, :rails_admin
      cannot :access, :judge
      can :read, Competition
      can :read, Problem
      can [:create, :update], Solution
    elsif user.role?("judge")
      cannot :access, :rails_admin
    end
  end
end
