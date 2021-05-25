class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :check_auth, except: [:index, :show]
  
  def index
    # Get all the blog posts and order in decrescent order 
    @blogs = Blog.order(created_at: :desc)
  end

  def show
  end

  def new
    # Create a new blog post. Use as a model to form 
    @blog = Blog.new
  end

  def create
    # Create a new blog post. If input valid, save  
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
    # Update blog post 
    if @blog.update(blog_params)
      redirect_to @blog
    else 
      flash.now[:errors] = @blog.errors.full_messages
      render action: "edit"
    end 
  end

  def destroy
    # Delete blog post
    @blog.destroy
      redirect_to blogs_path
  end

  private

  def set_blog
    # Get blog post using the blog post params
    @blog = Blog.find(params[:id])
  end

  def blog_params 
    params.require(:blog).permit(:title, :author, :post, :cover)
  end

  def check_auth
    authorize Blog
  end
  
end
