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

  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403.html.erb", status: 403, layout: false
  end


end
