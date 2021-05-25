class CheckoutController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:buy]

    def buy
        # Populate an array with all the products presented in cart
        @products = @cart.map do |p| 
            {price_data: {
                unit_amount: (p.price.to_f * 100).to_i,
                currency: 'aud',
                product_data: {
                    name: p.name,
                  },
                },
                quantity: 1,
            }
        end

        Stripe.api_key = ENV["STRIPE_PRIVATE_KEY"]
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: @products,
            mode: 'payment',
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url,
        })

        render json: session 
    end

    def success
        # Reduce stock level
        total_ammount = 0
        @cart.each do |item|
            item.decrement!(:stock)
            total_ammount += item.price * 1
        end

        # Add and save succesful order to Order model
        Order.create(user_id: current_user.id, shoes: @cart, total_ammount: total_ammount)
        
        # Empty cart and empty session cart 
        @cart = []
        session[:cart] = []
    end

    def cancel
    end

end
