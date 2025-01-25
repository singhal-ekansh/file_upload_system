class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :attachment
  
  validate :attachment_size
  validates :title, :description, presence: true

  def attachment_size
    if attachment.attached? && attachment.blob.byte_size > 2.gigabyte
      errors.add(:attachment, "size must be less than 1 GB")
    end
  end
end
