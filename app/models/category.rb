class Category < ApplicationRecord
  require 'babosa'
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_many :child, class_name: 'Category', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id

  has_many :products

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :vietnamese).to_s
  end

  def should_generate_new_friendly_id
    slug.blank? || self.title_changed?
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  icon       :string
#  published  :boolean
#  slug       :string
#  tag        :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
