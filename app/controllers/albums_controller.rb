class AlbumsController < ApplicationController
  before_action :require_login
  
  def new
    @bands = Band.all
    @current_band = Band.find(params[:band_id])
    render :new
  end

  def create
    @album = Album.create(album_params)
    if @album.save!
      redirect_to album_path(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end

  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
    @album.save!
    redirect_to album_url(@album)
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    @album = Album.find(params[:id])
    redirect_to band_url(@album.band_id)
    @album.destroy!
  end


  def album_params
    params.require(:album).permit(:band_id, :performance, :title)
  end
end
