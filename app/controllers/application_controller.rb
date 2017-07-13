class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  alias_method :current_user, :current_lyduser # Could be :current_member or :logged_in_user

  before_action :authenticate_lyduser!


end
