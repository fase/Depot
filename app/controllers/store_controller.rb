class StoreController < ApplicationController
  def index
    @products = Product.all
    @visits = update_counter
  end
end
