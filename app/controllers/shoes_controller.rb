class ShoesController < ApplicationController
    before_action :authenticate_user!

    def index 
        @shoes = Shoe.order(:created_at)
    end 

    def show
        @shoes = Shoe.find(params[:id])
    end 

    def new
        @shoe = Shoe.new
      end
    
      def create
        @shoe = Shoe.new(shoe_params)
        @shoe.user_id = current_user.id
        @shoe.save
        redirect_to shoes_path
      end

      def edit
        @shoe = Shoe.find(params[:id])
      end
    
      def update
        @shoe = Shoe.find(params[:id])
        @shoe.update(shoe_params)
    
        redirect_to shoe_path(@shoe)
      end

      def destroy
        @shoe = Shoe.find(params[:id])
        @shoe.destroy
    
        redirect_to shoes_path
      end
    
      private
    
      def shoe_params
        params.require(:shoe).permit(:name, :description, :price)
      end

end
