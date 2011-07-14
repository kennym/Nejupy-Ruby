class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role?("administrator")
      can :manage, :all
    elsif user.role?("contestant")
      can :read, Competition
      can :read, Problem
      can [:create, :update, :destroy], Solution
    elsif user.role?("judge")
      # TODO
    end
  end
end
