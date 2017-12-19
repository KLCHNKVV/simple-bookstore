class AdminController < ApplicationController
  def index
    @total_orders = Order.count
    @order = Order.all
  end

end
