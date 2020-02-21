class Product < ApplicationRecord
  belongs_to :category

  has_attached_file :image, styles: { medium: "850x480", thumb: "430x240>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes

  mount_uploader :data_file, DataFileUploader

end
