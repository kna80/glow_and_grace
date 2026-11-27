require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "checkout redirects to cart when cart is empty" do
    get "/checkout"

    assert_redirected_to "/cart"
  end

  test "order creation redirects when cart is empty" do
    assert_no_difference "Order.count" do
      post "/checkout", params: {
        order: {
          customer_name: "Test Customer",
          email: "test@example.com",
          address: "123 Test Street"
        }
      }
    end

    assert_redirected_to "/cart"
  end

  test "order confirmation requires a valid order" do
    get "/orders/999999/confirmation"

    assert_response :not_found
  end
end
