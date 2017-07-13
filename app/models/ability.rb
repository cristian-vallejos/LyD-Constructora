class Ability
  include CanCan::Ability

  def initialize(lyduser)
    # Define abilities for the passed in user here. For example:
    #
       lyduser ||= Lyduser.new # guest user (not logged in)
       if lyduser.admin_role?
         can :manage, :all
       end
       if lyduser.asocial_role?
        can :manage, Asformulary
       end
       if lyduser.boperativos_role?
        can :manage, Loga
       end

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
