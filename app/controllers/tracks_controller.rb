class TracksController < ApplicationController
  before_filter :find_artist_and_album

	def new
    @track = @album.tracks.new
  end

  def create
    @track = @album.tracks.new(params[:track])
    if @track.save
     redirect_to artist_album_track_path(@artist, @album, @track)
    else
      flash[:error] = "track was not saved"
      render 'new'
    end
  end

  def destroy
    @track = Track.find(params[:album_id])
    @track.destroy

    redirect_to artist_path
  end

  def show
    @track = Track.find(params[:album_id])
  end

  def find_artist_and_album
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:album_id])
  end
end
