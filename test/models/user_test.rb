require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "a loss" do
    user = User.new
    user.email = "stdio@protonmail.ch"
    user.password = "123456789"
    user.firstname = "Jenkens"
    user.usertype = nil
    assert_not user.save, "Saved without usertype"
  end
end
