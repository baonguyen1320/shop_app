class Product < ApplicationRecord
  require 'babosa'
  require 'rubygems'
  require 'nokogiri'

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  has_attached_file :image, styles: { medium: "850x480", thumb: "430x240>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes

  validates :category, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true

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

# == Schema Information
#
# Table name: products
#
#  id                 :bigint           not null, primary key
#  buyer              :integer          default("0")
#  content            :text
#  data_file          :string(255)
#  image_content_type :string(255)
#  image_file_name    :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  language           :string(255)      default("English")
#  manufacturer       :string(255)
#  name               :string(255)
#  older_price        :decimal(8, 2)    default("0")
#  price              :decimal(8, 2)    default("0.00")
#  published          :integer          default("1")
#  sale_time          :datetime
#  slug               :string(255)
#  tags               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category_id        :bigint
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
