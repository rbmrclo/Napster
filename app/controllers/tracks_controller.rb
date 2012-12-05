class TracksController < ApplicationController
  before_filter :find_artist_and_album

  def index
    @tracks = @album.tracks
  end 

	def new
    @track = @album.tracks.new
  end

  def create
    @track = @album.tracks.new(params[:track])
    if @track.save
     redirect_to artist_album_tracks_path
    else
      flash[:error] = "track was not saved"
      render 'new'
    end
  end

  def destroy
    @track = @album.tracks.find(params[:id])
    @track.destroy

    redirect_to artist_album_tracks_path, :notice => "Successfully deleted #{@track.track_list.titlecase}"
  end

  def show
    @tracks = @album.tracks
  end

  def find_artist_and_album
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.find(params[:album_id])
  end
end
