require "test_helper"

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should display shopping cart" do
    get "/cart"
    assert_response :success
  end
end
