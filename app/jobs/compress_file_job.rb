require 'zip'

class CompressFileJob < ApplicationJob
  queue_as :default

  def perform(document_id)
    document = Document.find(document_id)
    attachment = document.attachment

    return unless attachment.attached?

    if attachment.image?
      Rails.logger.info "Image files do not require compression."
      return
    end

    compress_file(attachment)
  end

  private

  def compress_file(attachment)
    temp_file = Tempfile.new(attachment.filename.to_s)
    zip_file = Tempfile.new(["compressed", ".zip"])

    begin
      # Download the file to Tempfile
      Rails.logger.info "Downloading file to temp file..."
      File.open(temp_file.path, 'wb') do |file|
        file.write(attachment.download)
      end

      # Compress the file
      Rails.logger.info "Compressing file..."
      Zip::File.open(zip_file.path, Zip::File::CREATE) do |zip|
        zip.add(attachment.filename.to_s, temp_file.path)
      end

      # Replace the original file with the compressed file
      File.open(zip_file.path, 'rb') do |compressed_file|
        name = attachment.filename.base
        attachment.purge
        attachment.attach(
          io: compressed_file,
          filename: "#{name}.zip",
          content_type: "application/zip"
        )
      end

      Rails.logger.info "Compression successful. File replaced with compressed version."
    ensure
      # Cleanup
      temp_file.close
      temp_file.unlink
      zip_file.close
      zip_file.unlink
    end
  end
end
