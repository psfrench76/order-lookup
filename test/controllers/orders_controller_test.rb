require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

end
