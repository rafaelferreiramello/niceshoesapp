class OrdersController < ApplicationController
    
    def index
    end

    def buyer
        # Find orders that belongs to current user
        @orders_user = Order.where(user_id: current_user.id)
        @orders = @orders_user.order(created_at: :desc)
    end

    def seller
        # Get shoes that belongs to current user 
        @shoes = Shoe.where(user_id: current_user.id)
    end

end
