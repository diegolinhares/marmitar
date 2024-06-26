require "test_helper"

class Api::V1::Restaurants::CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)
  end

  test "should create customer" do
    assert_difference("Customer.count") do
      post api_v1_restaurant_customers_url(@restaurant), params: {
        customer: {
          name: "New Customer",
          phone: "123456789"
        }
      }, headers: { "Authorization" => "Token #{@user.api_access_token}" }, as: :json
    end

    assert_response :created
  end

  test "should not create customer with invalid phone" do
    post api_v1_restaurant_customers_url(@restaurant), params: {
      customer: {
        name: "New Customer",
        phone: nil
      }
    }, headers: { "Authorization" => "Token #{@user.api_access_token}" }, as: :json

    assert_response :unprocessable_entity
  end

  test "should not create customer with missing name" do
    post api_v1_restaurant_customers_url(@restaurant), params: {
      customer: {
        name: nil,
        phone: "123456789"
      }
    }, headers: { "Authorization" => "Token #{@user.api_access_token}" }, as: :json

    assert_response :unprocessable_entity
  end
end
