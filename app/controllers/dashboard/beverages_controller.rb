class Dashboard::BeveragesController < ApplicationController
  before_action :find_beverages, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  def index
    @beverages = current_user.beverages.page(params[:page]).per(4)
    @orders_buy = current_user.orders
    @orders_sell = current_user.beverages.map { |b| b.orders }
  end

  def show
    redirect_to root_path if @beverage.user != current_user
  end

  def new
    @beverage = Beverage.new

    # @categories = Beverage.pluck(:category).uniq
  end

  def get_categories
    @categories = Beverage.where(genre: params[:genre].downcase).pluck(:category).uniq
    @categories << "Other"
    # render :json => @categories.map { |c| { category: c.category } }
    respond_to do |format|
      format.json { render json: @categories, status: 200 }
    end
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
    redirect_to root_path if @beverage.user != current_user
  end

  def update
    @beverage.update(params_beverages)
    redirect_to dashboard_beverage_path(@beverage)
  end

  def destroy
    @beverage.published = false
    @beverage.save
    redirect_to dashboard_beverages_path
  end

  private

  def find_beverages
    @beverage = Beverage.find(params[:id])
  end

  def params_beverages
    params.require(:beverage).permit(:name, :price, :stock, :genre, :category, :brand, :description, :photo)
  end

end
