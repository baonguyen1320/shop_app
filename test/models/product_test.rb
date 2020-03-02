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
#  price              :decimal(8, 2)    default("0.00")
#  published          :integer          default("1")
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
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
