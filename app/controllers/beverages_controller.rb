class BeveragesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @beverages = Beverage.all
  end

end
