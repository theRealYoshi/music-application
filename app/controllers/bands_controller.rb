class BandsController < ApplicationController

  before_action :check_for_bands, only: [:edit, :destroy]

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @band = Band.create(band_params)
    if @band.save!
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    @band.save!
    redirect_to band_url(@band)
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy!
    redirect_to bands_url
  end

  def check_for_bands
    if !Band.all.nil?
      @bands = Band.all
    else
      flash[:errors] = "No bands to edit"
    end
  end

  private

    def band_params
      params.require(:band).permit(:name)
    end

end
