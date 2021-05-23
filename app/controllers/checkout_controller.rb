class CheckoutController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:buy]


    def buy
        p "-----------------------"
        p @cart
        p "-------------------------"

        @line = @cart.map do |p| 
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
        p "-----------------------"
        p @line
        p "-------------------------"

        Stripe.api_key = ENV["STRIPE_PRIVATE_KEY"]
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: @line,
            mode: 'payment',
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url,
        })

        render json: session 
    end

    def success
    end

    def cancel
    end

end
