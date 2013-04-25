class Ability
  include CanCan::Ability
  
  def initialize(thisuser)
    thisuser ||= User.new
    
    if thisuser.has_role? :administrator
      can :manage, :all
    else
      if thisuser.has_role? :participant
        can :manage, thisuser
      end
      can :index, :all
      can :create, :all
    end
  end
end