class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @wine = Wine.find(params[:wine_id])
    @review = Review.new
  end

	def create
	    @review = Review.new(review_params)
	    @wine = Wine.find(params[:wine_id])
	    @review.wine = @wine
	    if @review.save
	      redirect_to wine_path(@wine)
	    else
	      render :show
	    end
  	end
  	

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
