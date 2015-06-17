require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :redirect
  end

end
