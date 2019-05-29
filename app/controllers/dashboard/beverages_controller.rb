class Dashboard::BeveragesController < ApplicationController
  before_action :find_beverages, only: %i[show edit update destroy]
  def index
    @beverages = current_user.beverages
    @orders_buy = current_user.orders
    @orders_sell = current_user.beverages.map { |b| b.orders }
  end

  def show
  end

  def new
    @beverage = Beverage.new
  end

  def create
    @beverage = Beverage.new(params_beverages)
    @beverage.user = current_user
    if @beverage.save
      redirect_to dashboard_beverage_path(@beverage)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @beverage.update(params_beverages)
    redirect_to dashboard_beverage_path(@beverage)
  end

  def destroy
    @beverage.destroy
    redirect_to dashboard_beverages_path
  end

  private

  def find_beverages
    @beverage = Beverage.find(params[:id])
  end

  def params_beverages
    params.require(:beverage).permit(:name, :price, :stock, :genre, :category, :brand, :description)
  end

end