class BlogsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Blog.order(:created_at)
  end

  def show
  end

  def new
    @post = Blog.new
  end

  def create
    @post = Blog.new(post_params)
        if @post.save
            redirect_to @post
        else 
            flash.now[:errors] = @post.errors.full_messages
            render action: "new"
        end 
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else 
      flash.now[:errors] = @post.errors.full_messages
      render action: "edit"
    end 
  end

  def destroy
    @post.destroy
      redirect_to blogs_path
  end

  private

  def set_post
      @post = Blog.find(params[:id])
  end

  def post_params 
    params.require(:blog).permit(:title, :author, :post, :cover)
  end

end
