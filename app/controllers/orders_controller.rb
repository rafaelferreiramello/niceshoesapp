class OrdersController < ApplicationController
    def index
    end

    def buyer
        @orders = Order.where(user_id: current_user.id)
    end

    def seller
    end
end
