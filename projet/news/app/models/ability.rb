class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
	
	if user.role == "admin"
		can :manage, :all
		can :reset_password, User
	end
	
	if user.role == "author"
		can :manage, Report
		can :manage, Source
	end
	
	can :read, Report
	can :read, Category
	can :read, Source
  end
end
