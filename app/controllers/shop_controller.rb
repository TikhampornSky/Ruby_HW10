class ShopController < ApplicationController
    def shop
        @user_id = params[:id]
        @myItem = Item.where(user_id: @user_id).all
    end
end
