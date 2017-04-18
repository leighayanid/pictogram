class Ability
  include CanCan::Ability

  def initialize(user)
  	user || User.new
    if user && user.admin?
    	can :manage, :all
    else
    	can :read, :all
    	can :create, Photo
        can :upvote, Photo
    	# check if the user is associated with the photo
    	can :update, Photo do |photo|
    		photo.user == user
    	end
    	# check if the user is associated with the photo before deleting
    	can :destroy, Photo do |photo|
    		photo.user == user
    	end
    end
  end
end