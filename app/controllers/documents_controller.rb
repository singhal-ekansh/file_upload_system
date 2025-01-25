class DocumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @documents = current_user.documents.includes(:attachment_blob)
  end

  def new
    @document = Document.new
  end

  def create
    @document = current_user.documents.new(document_params)
    if @document.save
      redirect_to documents_path, notice: 'File uploaded successfully.'
    else
      render :new, alert: 'Failed to upload file.'
    end
  end

  def destroy
    @document = current_user.documents.find(params[:id])
    @document.destroy
    redirect_to documents_path, notice: 'File deleted successfully.'
  end

  def show
    @attachment = ActiveStorage::Attachment.joins(:blob).find_by(blob: { key: params[:id] })
  end

  private

  def document_params
    params.require(:document).permit(:title, :description, :attachment)
  end
end
