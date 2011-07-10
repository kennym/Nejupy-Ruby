class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.has_role?("Administrator")
  end
end
