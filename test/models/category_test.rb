# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  icon       :string(255)
#  published  :integer          default("1")
#  slug       :string(255)
#  tag        :integer
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
