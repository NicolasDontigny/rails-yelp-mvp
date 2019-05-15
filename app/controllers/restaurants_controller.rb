class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @show = true
    @review = Review.new
  end

  def new
    @create_page = true
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(params_permit)

    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def params_permit
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
