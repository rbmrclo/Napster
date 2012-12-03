class AlbumsController < ApplicationController
	def create
		@artist = Artist.find(params[:artist_id])
		@album = @artist.albums.new(params[:album])
		if @album.save
			redirect_to artist_path(@artist)
		else
			flash[:error] = "track was not saved"
			render 'new'
		end
	end

	def new
		@artist = Artist.find(params[:artist_id])
		@album = @artist.albums.new
	end

	def show
		@artist = Artist.find(params[:artist_id])
		@album = @artist.albums.find(params[:artist_id])
	end

end
