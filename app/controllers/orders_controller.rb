class OrdersController < ApplicationController
    def index
    end

    def buyer
        @orders_user = Order.where(user_id: current_user.id)
        @orders = @orders_user.order(created_at: :desc)
    end

    def seller
        @shoes_user = Shoe.where(user_id: current_user.id)
        @shoes = @shoes_user.order(created_at: :desc)
        @shoes.each do |shoe|
            @orders = Order.where(user_id: shoe.user_id)
        end 
        p "--------------------------"
        p @orders
        p "--------------------------"
    end
end
