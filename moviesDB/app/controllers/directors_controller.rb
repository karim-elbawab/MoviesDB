class DirectorsController < ApplicationController
	before_action :authenticate_admin!, only: [:new, :update, :edit]
	def index
		@directors = Director.all
	end
	def new
		@director = Director.new
	end
	def create
		@director = Director.new(director_params)
		@director.save

		redirect_to @director
	end
	def show
		@director = Director.find(params[:id])
	end
	def edit
		@director = Director.find(params[:id])
	end
	def update
		@director = Director.find(params[:id])
		@director.update(director_params)

		redirect_to @director
	end
	def destroy
		@director = Director.find(params[:id])
		@director.destroy

		redirect_to directors_path
	end

	protected
	def director_params
		params.require(:director).permit(:name, :image_url, :description, :birthdate, :birthplace)
	end
end	