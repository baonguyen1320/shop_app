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
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
