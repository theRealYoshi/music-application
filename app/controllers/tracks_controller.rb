class TracksController < ApplicationController
  before_action :require_login

  def new
    @album = Album.find(params[:album_id])
    @albums = @album.band.albums
    render :new
  end

  def create
    @track = Track.create(track_params)
    if @track.save!
      redirect_to track_path(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    @albums = @track.band.albums
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    @track.update(track_params)
    @track.save!
    render :show
  end

  def destroy
    @track = Track.find(params[:id])
    redirect_to album_path(@track.album_id)
    @track.destroy!
  end

  private
    def track_params
      params.require(:track).permit(:album_id, :track_type, :lyrics, :track_title)
    end

end
