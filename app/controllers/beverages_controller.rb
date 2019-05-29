class BeveragesController < ApplicationController
  before_action :find_beverage, only: %i[show buy finalize]
  before_action :find_order, only: :seller
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @beverages = Beverage.all
  end

  def show
  end

  def buy
    @order = Order.new
  end

  def finalize
    @order = Order.new(params_orders)
    @order.price = @beverage.price
    @order.total_price = @beverage.price * @order.quantity
    @order.user = current_user
    @order.beverage = @beverage
    if @order.save
      redirect_to beverages_seller_path(@order)
    else
      render :buy
    end
  end

  def seller
  end

  private

  def find_beverage
    @beverage = Beverage.find(params[:id])
  end

  def find_order
    @order = Order.find(params[:id])
  end

  def params_orders
    params.require(:order).permit(:quantity)
  end
end