class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, except: [:index, :show]
  
  def index
    @blogs = Blog.order(created_at: :desc)
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
        if @blog.save
            redirect_to @blog
        else 
            flash.now[:errors] = @blog.errors.full_messages
            render action: "new"
        end 
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else 
      flash.now[:errors] = @blog.errors.full_messages
      render action: "edit"
    end 
  end

  def destroy
    @blog.destroy
      redirect_to blogs_path
  end

  private

  def set_blog
      @blog = Blog.find(params[:id])
  end

  def blog_params 
    params.require(:blog).permit(:title, :author, :post, :cover)
  end

  def check_auth
    authorize Blog
end
end
