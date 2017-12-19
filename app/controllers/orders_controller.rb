class OrdersController < ApplicationController
  include CurrentCart
  before_action :authorize
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_inst_empty, only: :new
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  def index
    @orders = Order.all
  end

  def show
  end


  def new
    @order = Order.new
  end


  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    respond_to do |format|
      if @order.save
        OrderMailer.received(@order).deliver_later
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to store_index_url, notice: 'Thanks for your order. Await futher instructions at email.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    OrderMailer.shipped(@order).deliver_later
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully received by customer #{@order.name}." }
      format.json { head :no_content }
    end
  end

  private
  def ensure_cart_inst_empty
    if @cart.line_items.empty?
      redirect_to store_index_url, notice: 'Your cart is empty'
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :pay_type, :email)
    end
end
