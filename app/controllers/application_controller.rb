class ApplicationController < ActionController::Base
	private

	helper_method def current_user
		return @_current_user if defined?(@_current_user)
		@_current_user = User.find_by(id: session[:user_id])
	end

	helper_method def logged_in?
  	!current_user.nil?
	end
end
