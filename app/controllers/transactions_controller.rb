class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    
    def create
        Stripe.api_key = ENV["STRIPE_PRIVATE_KEY"]
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
            price_data: {
                unit_amount: 2000,
                currency: 'usd',
                product_data: {
                name: 'Stubborn Attachments',
                images: ['https://i.imgur.com/EHyR2nP.png'],
                },
            },
            quantity: 1,
            }],
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
