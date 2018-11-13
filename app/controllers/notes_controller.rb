class NotesController < ApplicationController

  before_action :get_note, only: [:edit, :update, :destroy]

  def index
    @notes = current_user.user_notes.flatten
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    current_user.notes << @note
    if @note.valid?
      @note.save
      current_user.user_notes << @note

      redirect_to project_path(@note.project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update!(note_params)
      redirect_to project_path(@note.project)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to project_path(@note.project)
  end

  private

    def get_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :project_id, :user_id)
    end

end
