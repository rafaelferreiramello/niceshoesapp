class ShoesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :create, :update]
  
  def add_to_cart
    # Add shoe to cart during session using shoe params
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to shoes_path
  end

  def remove_from_cart
    # Remove shoe to cart during session using shoe params
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to shoes_path
  end

  def index 
    # Get all shoes and order according to creation time
    @shoes = Shoe.order(:created_at)
  end 

  def show
  end 

  def new
    # Create a shoe. Use as a model to form 
    @shoe = Shoe.new
  end
    
  def create
    # Create a new shoe. If input valid, save  
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
    # Update shoe
    if @shoe.update(shoe_params)
      redirect_to shoe_path(@shoe)
    else
      flash.now[:errors] = @shoe.errors.full_messages
      render action: "edit"
    end
  end

  def destroy
    # Delete instances related to shoe in the join table
    @shoecategories = ShoeCategory.where(shoe_id: @shoe.id)
    @shoecategories.each do |shoecategory|
      shoecategory.destroy
    end
    # Delete shoe
    @shoe.destroy
    redirect_to shoes_path
  end
    
  private

  def set_shoe
    # Get shoe using the blog post params
    @shoe = Shoe.find(params[:id])
  end

  def set_categories
    # Get all categories and order according to category's name 
    @categories = Category.order(:name)
  end
    
  def shoe_params
    params.require(:shoe).permit(:name, :description, :price, :brand, :size, :stock, :photo, category_ids: [])
  end

  def check_auth
    authorize @shoe
  end

end
