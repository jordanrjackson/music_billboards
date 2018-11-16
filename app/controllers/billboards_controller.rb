class BillboardsController < ApplicationController
  before_action :set_billboard, except: [:index, :new, :create]
  # before_action :set_billboard, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_paid, only: :index
  after_action :more_cowbell

  def index
    @billboards = Billboard.all
  end

  def show
    @artists = Billboard.artists
  end

  def new
    @billboard = Billboard.new
    render partial: "form"
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboards.save
      redirect_to_billboards_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to billboards_path
    else
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  
  private
    def more_cowbell
      puts "DING DING DING!"
    end

    def set_billboard
      @billboard = Billboard.find(params[:id])
    end

    def billboard_params
      params.require(:billboard).permit(:name)
    end
  
  end