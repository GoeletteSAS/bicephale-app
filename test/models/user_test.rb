require "test_helper"

class UserTest < ActiveSupport::TestCase
  has_many :experiences, dependent: :destroy
  has_many :searches, dependent: :destroy
  # test "the truth" do
  #   assert true
  # end
end
