class MainController < ApplicationController
    def login
    end

    def create
        u = User.where(login: params[:login]).first
        if u && u.authenticate(params[:password])
            redirect_to '/main/user_Item'
            session[:logged_in] = true
            session[:user_id] = u.id
        else 
            session[:logged_in] = false
            redirect_to '/main/login', notice: 'Wrong Username or Password'
        end
    end

    def destroy
        reset_session
    end

    def user_Item
        if (session[:logged_in] == false) 
            redirect_to '/main/login', notice: 'Please Login!!!'
        end
        @items = Item.where(user_id: session[:user_id]).all
        @Iam = User.where(id: session[:user_id]).first
    end

    def inventories 
        if (session[:logged_in] == false) 
            redirect_to '/main/login', notice: 'Please Login!!!'
        end
        @user_id = session[:user_id]            #who login now
        @Iam = User.where(id: @user_id).first
        @myInvent = Inventory.where(user_id:@user_id).all
    end

    def destroy_item 
        @item = Item.find(params[:id])
        @item.destroy
        Inventory.destroy_by(item_id: params[:id])

        redirect_to '/main/user_Item', notice: 'Delete succesfully!!!'
    end
end
