class BeveragesController < ApplicationController
  before_action :find_beverage, only: %i[show buy finalize]
  before_action :find_order, only: :seller
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @beverages = Beverage.global_search(params[:query]).page(params[:page]).per(9)
    else
      @beverages = Beverage.page(params[:page]).per(9)
    end
  end

  def about
  end

  def show
  end

  def buy
    unless @beverage.user == current_user
      @order = Order.new
    else
      redirect_to beverages_path
    end
  end

  def finalize
    @order = Order.new(params_orders)
    @order.price = @beverage.price
    @order.total_price = @beverage.price * @order.quantity
    @order.user = current_user
    @order.beverage = @beverage
    if @order.save
      @beverage.stock -= @order.quantity
      @beverage.save
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
