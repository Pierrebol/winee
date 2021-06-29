class ReviewsController < ApplicationController
  def create
    @wine = Wine.find(params[:wine_id])
    @review = Review.new(review_params)
    @review.wine = @wine
    if @review.save
      redirect_to wine_path(@wine)
    else
      redirect_to wine_path(@wine)
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end