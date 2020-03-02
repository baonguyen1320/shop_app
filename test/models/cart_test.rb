# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  email      :string
#  string     :string
#  tag        :string
#  token_key  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
