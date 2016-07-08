class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
  end

  if user.admin?
  	can :manage, User
  else
  	can :manage, User, id: user.id
  end 
end
