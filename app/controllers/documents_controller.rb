class DocumentsController < ApplicationController
  def index
    @documents = current_user.documents
  end

  def new
    @document = Document.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  def create
    @document = Document.create(document_params.merge({user_id: current_user.id, status: Document::Uploading}))
    @volume_1 = params[:document][:volume_1]
    @volume_2 = params[:document][:volume_2]
    @volume_3 = params[:document][:volume_3]


    Document.process_excel(file: params[:document][:excel].path, document_id: @document.id)
    # asynchronous
    # ExcelProcessJob.perform_later(params[:document][:excel].path)

    if @document.save
      redirect_to documents_path
    else
      render "new"
    end
  end

  private

  def document_params
    params.require(:document).permit(:name, :user_id)
  end
end
