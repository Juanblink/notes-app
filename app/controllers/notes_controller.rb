class NotesController < ApplicationController
  before_action :find_note, only: %i[show edit update destroy]

  def index
    @notes = fetch_notes
  end

  def show; end

  def new
    @note = Note.new
  end

  def edit; end

  def create
    @note = Note.new(note_params)
    respond_to do |format|
      if @note.save
        format.html { redirect_to note_path(@note), notice: "La nota ha sido creada con éxito." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_path(@note), notice: "La nota ha sido actualizada con éxito." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_path, notice: "La nota ha sido eliminada exitosamente." }
      format.json { head :no_content }
    end
  end

  private

  def fetch_notes
    notes = Note.order(created_at: :desc)
    return notes unless params[:filters].present?

    filters = params[:filters].permit(:title)
    notes = notes.search_by_title(filters[:title]) if filters[:title].present?
    notes
  end

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
