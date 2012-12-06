class ArtistsController < ApplicationController
	def index
	   @artists = Artist.all
     @featured_artist = Artist.order("RANDOM()").first
	end

  def new 
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to artists_path
    else
      render 'new'
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to artists_path
    else
      render 'edit'
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @artists
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path, :notice => "Successfully Deleted #{@artist.name.titlecase}"
    
  end
end