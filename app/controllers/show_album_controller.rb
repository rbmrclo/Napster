class ShowAlbumController < ApplicationController
  def index
		@albums = Album.all
  end

end
