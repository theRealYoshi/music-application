class NotesController < ApplicationController

  before_action :require_login
  before_action :ensure_destroy_author, only: [:destroy]

  def create
    @note = Note.new(note_params)
    @note.track_id = params[:track_id]
    @note.user_id = current_user.id
    if @note.save
      redirect_to track_url(params[:track_id])
    else
      flash[:errors] = ["Note was not created"]
      redirect_to track_url(params[:track_id])
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to track_url(params[:track_id])
  end

  private

    def note_params
      params.require(:note).permit(:long_note)
    end

    def ensure_destroy_author
      @note = Note.find(params[:id])
      if @note.user_id != current_user.id
        render text: "You are not the author of this note"
      end
    end

end
