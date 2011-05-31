class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def reset_counter
    session[:counter] = nil if session[:counter]
  end

  def update_counter
    # If counter, add one to current value.  Else, set equal to 1.
    session[:counter] ? session[:counter] += 1 : session[:counter] = 1
  end
end
