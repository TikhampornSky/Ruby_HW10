class ApplicationController < ActionController::Base
    before_action :my_debug

    def my_debug
        pp "------------------------------------"
        pp session.to_h
    end

    def is_login?
        return session[:logged_in] == true
    end

    def must_be_logged_in
        if is_login?
            return true
        else
            redirect_to main_login_path, notice: "You must login"
        end
    end
end
