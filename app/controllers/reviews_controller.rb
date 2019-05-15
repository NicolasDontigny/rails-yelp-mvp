class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def create
    @review = Review.new(params_permit)
    @review.restaurant = @restaurant
    @review.save

    redirect_to restaurant_path(@restaurant) + "##{@review.id}"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def params_permit
    params.require(:review).permit(:content, :rating)
  end
end
