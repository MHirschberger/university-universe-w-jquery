class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !session[:user_id].nil?
    end

    def home
      if logged_in?
        redirect_to user_path(current_user)
      end
    end
    
end
