class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    song_data = song_params
    song_data[:artist_id] = @artist.id
    if Song.create(song_data)
      redirect_to "/songs"
    else
      redirect_to "/songs/new"
    end
  end

  private
    def song_params
      params.require(:song).permit(:title, :length, :play_count)
    end

end
