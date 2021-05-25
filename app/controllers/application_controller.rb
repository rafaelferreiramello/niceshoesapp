class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart

  include Pundit
  
  private
  
  def initialize_session
    session[:cart] ||= [] 
  end
  
  def load_cart
    # Find shoe that is added to the cart during the session and load the cart
    @cart = Shoe.find(session[:cart])
  end
  
end
