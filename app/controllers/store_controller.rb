class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.all
    @search_products = if params[:search]
                         Product.where('title LIKE ?', "%#{params[:search]}%")
                       else
                         Product.order(:title)
                      end
  end
end
