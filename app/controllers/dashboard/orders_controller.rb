class Dashboard::OrdersController < ApplicationController
  before_action :find_order, only: %i[show destroy posted]

  def show
  end

  def destroy
    unless @order.status == 'finalized' || @order.status == 'posted'
      @order.status = "canceled"
      @order.save
      redirect_to dashboard_beverages_path
    end
  end

  def posted
    @order.status = 'posted'
    @order.save
    redirect_to dashboard_beverages_path
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
end
