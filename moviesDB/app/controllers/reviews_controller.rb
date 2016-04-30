class ReviewsController < ApplicationController
	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.save
		redirect_to movie_path(@review.movie_id)
	end
	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to movie_path(@review.movie_id)
	end
protected
	def review_params
		params.require(:review).permit(:movie_id, :description, :rating)
	end
end	