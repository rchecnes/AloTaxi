require 'test_helper'

class ServiceCustommersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
