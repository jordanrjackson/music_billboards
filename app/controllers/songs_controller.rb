class SongsController < ApplicationController
  before_action :set_artist

  def new
    @song = @artist.songs.new
  end

  def show 
    @songs = @artist.songs.all
  end

  def create
    @song = @artist.song.new(song_params)
    if @song.save
      redirect_to billboard_artist_path(@artist.billboard_id, @artist)
    else
      render :new
    end
  end

  private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def song_params
      params.require(:song).permit(:body, :author)
    end
  end