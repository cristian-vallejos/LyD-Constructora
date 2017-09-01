class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  alias_method :current_user, :current_lyduser # Could be :current_member or :logged_in_user

  before_action :authenticate_lyduser!
  before_action :validate_user


  def validate_user

  	if lyduser_signed_in?
  		if current_lyduser.is_active == false 
  			sign_out current_lyduser
  			redirect_to new_lyduser_session_path
  		end
  	end

  end


end
