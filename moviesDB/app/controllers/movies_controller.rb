class MoviesController < ApplicationController
	before_action :authenticate_admin!, only: [:new, :update, :edit]
	def index
		@movies = Movie.all
	end
	def new
		@movie = Movie.new
	end
	def create
		@movie = Movie.new(movie_params)
		@movie.director_id = Director.find_by(name: params[:director_name]).id
		@movie.save

		redirect_to @movie
	end
	def show
		@movie = Movie.find(params[:id])
		@watchlist = Watchlist.new
		@review = Review.new
	end
	def edit
		@movie = Movie.find(params[:id])
	end
	def update
		@movie = Movie.find(params[:id])
		@movie.update(movie_params)
		#puts  Director.find_by(name: @movie.director_name).id 
		@movie.director_id = Director.find_by(name: @movie.director_name).id
		@movie.save
		redirect_to @movie
	end
	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy

		redirect_to movies_path
	end

protected
	def movie_params
		params.require(:movie).permit(:name, :image_url, :description, :release_date, :director_name, :actors)
	end
end