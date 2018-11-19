class ArtistsController < ApplicationController
  before_action :set_billboard
  before_action :set_artist, except: [:index, :new, :create]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = @Artist.new
  end

  def create
    @artist = @Artist.new(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_url
  end

  private
   
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :genre, :age, :active)
    end
  end