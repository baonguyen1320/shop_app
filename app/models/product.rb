class Product < ApplicationRecord
  require 'babosa'
  require 'rubygems'
  require 'nokogiri'

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :category

  has_attached_file :image, styles: { medium: "850x480", thumb: "430x240>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes

  mount_uploader :data_file, DataFileUploader

  before_save :replace_image_tag

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :vietnamese).to_s
  end

  def should_generate_new_friendly_id
    slug.blank? || self.name_changed?
  end

  private

  def replace_image_tag
    image_content = Nokogiri::HTML(self.content)
    array_images = image_content.css('img')

    array_images.each do |image|
      image['style'] = "max-width: 100%; width: auto; height: auto;"
      source_img = image['src']
      source_img = source_img.gsub("/content_", '/')
      image['src'] = source_img
    end

    # write_attributen dont save to db
    write_attribute(:content, image_content)
  end
end
