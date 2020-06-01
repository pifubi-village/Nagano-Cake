require 'test_helper'

class Admin::OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get products" do
    get admin_order_products_url
    assert_response :success
  end

  test "should get update" do
    get admin_order_update_url
    assert_response :success
  end

end
