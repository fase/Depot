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
    session[:counter] = nil if !session[:counter].nil?
  end

  def update_counter
    counter = 1

    if !session[:counter].nil?
      counter = session[:counter] + 1
    end

    session[:counter] = counter

    counter
  end
end
