class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @search = Product.search do
      fulltext params[:search]
    end
    @products = Product.order(sort_column + " " + sort_direction)
    @products = @search.results
  end

  def sort_column
    params[:sort] || 'price'
  end

  def sort_direction
    params[:direction] || 'asc'
  end

end
