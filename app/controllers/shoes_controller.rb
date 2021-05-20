class ShoesController < ApplicationController
  before_action :authenticate_user!

  def index 
    @shoes = Shoe.order(:created_at)
  end 

  def show
    @shoes = Shoe.find(params[:id])
  end 

  def new
    @categories = Category.order(:name)
    @shoe = Shoe.new
  end
    
  def create
    @categories = Category.order(:name)
    @shoe = Shoe.new(shoe_params)
    @shoe.user_id = current_user.id
    if @shoe.save
      redirect_to @shoe
    else 
      flash.now[:errors] = @shoe.errors.full_messages
      render action: "new"
    end 
  end

  def edit
    @categories = Category.order(:name)
    @shoe = Shoe.find(params[:id])
  end
    
  def update
    @categories = Category.order(:name)
    @shoe = Shoe.find(params[:id])
    if @shoe.update(shoe_params)
      redirect_to shoe_path(@shoe)
    else
      flash.now[:errors] = @shoe.errors.full_messages
      render action: "edit"
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
    redirect_to shoes_path
  end
    
  private
    
  def shoe_params
    params.require(:shoe).permit(:name, :description, :price, :stock, genre_ids: [])
  end

end
