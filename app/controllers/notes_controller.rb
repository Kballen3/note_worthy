class NotesController < ApplicationController
  def index
    @notes = Note.all
    render :index
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def new
    @note = Note.new
    render :new
  end

  def create
    @note = Page.new(note_params)

    if @note.save
      redirect_to notes_path
    else 
      render :new
    end  
    
  end

end

private

def note_params
  params.require(:note).permit(:title, :author, :body, :category)

end

