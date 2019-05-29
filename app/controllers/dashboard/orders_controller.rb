class Dashboard::OrdersController < ApplicationController
  before_action :find_order, only: %i[show destroy ship_order delivered]

  def show
  end

  def destroy
    unless @order.status == 'finalized' || @order.status == 'shipped'
      @order.status = "canceled"
      @order.save
      redirect_to dashboard_beverages_path
    end
  end

  def ship_order
    @order.status = 'shipped'
    @order.save

    redirect_to dashboard_beverages_path
  end

  def delivered
    if @order.status == 'shipped'
      @order.status = 'finalized'
      @order.save
    end

    redirect_to dashboard_beverages_path
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end
end
