class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @search = Product.search do
      fulltext params[:search]
    end
    @products = @search.results
  end
end
