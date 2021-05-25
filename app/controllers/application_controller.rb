class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart

  include Pundit
  
  private
  
  def initialize_session
    session[:cart] ||= [] 
  end
  
  def load_cart
    @cart = Shoe.find(session[:cart])
  end
  
end
