class WatchlistsController < ApplicationController
	def create
		@watchlist = Watchlist.new(watchlist_params)
		@watchlist.user_id = current_user.id
		@watchlist.save
		redirect_to watchlist_user_path(current_user)
	end
	def destroy
		@watchlist = Watchlist.find(params[:id])
		@watchlist.destroy
		redirect_to watchlist_user_path(current_user)
	end
protected
	def watchlist_params
		params.require(:watchlist).permit(:movie_id)
	end
end	