class SongsController < ApplicationController
  before_action :set_artist
  before_action: set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = @artist.songs.all
  end
  
  def new
    @song = @artist.songs.new
  end

  def edit
  end

  def show 
    @songs = @artist.songs.all
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_song_path(@artist, @song)
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to artist_song_path(@artist, @song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end

  private
    
  def set_song
    @song = @artist.songs.find(params[:id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title, :duration, :belongs_to, :belongs_to)
  end
end