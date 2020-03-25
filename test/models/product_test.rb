# == Schema Information
#
# Table name: products
#
#  id                 :bigint           not null, primary key
#  buyer              :integer          default("0")
#  content            :text
#  data_file          :string
#  image_content_type :string
#  image_file_name    :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  langugage          :string           default("English")
#  manufacturer       :string
#  name               :string
#  older_price        :decimal(8, 2)    default("0")
#  price              :decimal(8, 2)    default("0")
#  published          :boolean          default("true")
#  sale_time          :datetime
#  slug               :string
#  tags               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category_id        :bigint
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
