class AlbumsController < ApplicationController
	before_filter :find_artist

	def index
		@albums = @artist.albums
	end

	def new
		@album = @artist.albums.new
	end

	def create
		@album = @artist.albums.new(params[:album])
		if @album.save
			redirect_to artist_path(@artist)
		else
			flash[:error] = "track was not saved"
			render 'new'
		end
	end
	
	def edit
		@album = @artist.albums.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
    
    	if @album.update_attributes(params[:album])
      		redirect_to artist_albums_path
    	else
      		render 'edit'
   	 	end
  	end

  	def destroy
  		@album = @artist.albums.find(params[:id])
  	    @album.destroy
    	redirect_to artist_albums_path, :notice => "Successfully deleted #{@album.album_name.titlecase}"
    	
  	end

  	

	def find_artist
		@artist = Artist.find(params[:artist_id])
	end



end
