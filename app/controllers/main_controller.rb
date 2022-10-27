class MainController < ApplicationController
    def login
    end

    def create
        u = User.where(login: params[:login]).first
        if u && u.authenticate(params[:password])
            redirect_to '/main/user_items'
            session[:logged_in] = true
            session[:user_id] = u.id
        else 
            session[:logged_in] = false
            redirect_to '/main/login'
        end
    end

    def destroy
        reset_session
    end

    def user_items
        if (session[:logged_in] == false) 
            redirect_to '/main/login'
        end
        @items = Item.where(user_id: session[:user_id]).all
        @Iam = User.where(id: session[:user_id]).first
    end
end
