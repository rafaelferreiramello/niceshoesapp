class OrdersController < ApplicationController
    def index
    end

    def buyer
        @orders_user= Order.where(user_id: current_user.id)
        @orders = @orders_user.order(created_at: :desc)
    end

    def seller
    end
end
