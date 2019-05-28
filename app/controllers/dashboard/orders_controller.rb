class Dashboard::OrdersController < ApplicationController
  before_action :find_order, only: %i[show destroy]

  def show
  end

  def destroy
    unless @order.status == 'finalized' || @order.status == 'posted'
      @order.status = "canceled"
      @order.save
      redirect_to dashboard_beverages_path
    end
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
end
