class StoreController < ApplicationController
  def index
    @products = Product.all
    @cart = current_cart

    @visits = update_counter
  end
end
