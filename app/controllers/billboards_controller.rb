class BillboardsController < ApplicationController
  before_action :set_billboard, except: [:index, :new, :create]

  def index
    @billboards = current_user.Billboard.all
  end

  def show
    @songs = billboard.songs
  end

  def new
    @billboard = Billboard.new
  end

  def create
    @billboard = current_user.Billboard.new(billboard_params)
    if @billboard.save
      flash[:success] = "Billboard Created!"
      redirect_to @billboard
    else
      flash[:error] = "Error #{@billboard.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to @billboard
    else
      render :edit
    end
  end

  def destroy
    @billboard.songs.update_all(billboard_id: nil)
    @billboard.destroy
    redirect_to billboards_url
  end

  def new_song
    @songs = Song.all.where(billboard_id: nil)
  end

  def add_song
    @billboard.songs << Song.find(params[:song_id])
    redirect_to billboard_path(@billboard)
  end

  def remove_song
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end
  
  private

    def billboard_params
      params.require(:billboard).permit(:first_name, :last_name)
    end
  
    def set_billboard
      @billboard = current_user.Billboard.find(params[:id])
    end
end