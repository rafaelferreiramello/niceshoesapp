class ShoesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :create, :update]

  def index 
    @shoes = Shoe.order(:created_at)
  end 

  def show
  end 

  def new
    @shoe = Shoe.new
  end
    
  def create
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
  end
    
  def update
    if @shoe.update(shoe_params)
      redirect_to shoe_path(@shoe)
    else
      flash.now[:errors] = @shoe.errors.full_messages
      render action: "edit"
    end
  end

  def destroy
    @shoecategories = ShoeCategory.where(shoe_id: @shoe.id)
    @shoecategories.each do |shoecategory|
      shoecategory.destroy
    end
    @shoe.destroy
    redirect_to shoes_path
  end
    
  private

  def set_shoe
    @shoe = Shoe.find(params[:id])
  end

  def set_categories
    @categories = Category.order(:name)
  end
    
  def shoe_params
    params.require(:shoe).permit(:name, :description, :price, :stock, :photo, category_ids: [])
  end

end
