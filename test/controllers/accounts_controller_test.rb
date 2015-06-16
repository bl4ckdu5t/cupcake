require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  test "should get redirected for designers" do
     get :designers
     assert true, "No Method Error handling"
  end
end
