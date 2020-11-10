class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    before_action :authorized
    skip_before_action :authorized, only: [:show]

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
    
    def authorized
        redirect_to login_path unless logged_in?
    end

    def show
        render :'layouts/show'
    end
end
