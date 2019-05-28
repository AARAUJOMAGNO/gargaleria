class Dashboard::OrdersController < ApplicationController
  before_action :find_order, only: %i[show destroy]

  def show
  end

  def destroy
    @order.status = "canceled"
    @order.save
    redirect_to dashboard_beverages_path
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
end
