require "test_helper"

class Api::V1::Restaurants::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
    @customer = customers(:one)
    @meal_box = meal_boxes(:one)
    @user = users(:one)
  end

  test "should create order" do
    assert_difference("Order.count") do
      post api_v1_restaurant_orders_path(@restaurant), params: {
        order: {
          phone: @customer.phone,
          meal_box_id: @meal_box.id,
          quantity: 2
        }
      }, headers: { "Authorization" => "Token #{@user.api_access_token}" }, as: :json
    end

    assert_response :created
  end

  test "should not create order with invalid phone" do
    post api_v1_restaurant_orders_path(@restaurant), params: {
      order: {
        phone: "invalid-phone",
        restaurant_id: @restaurant.id,
        meal_box_id: @meal_box.id,
        quantity: 2
      }
    }, headers: { "Authorization" => "Token #{@user.api_access_token}" }, as: :json

    assert_response :unprocessable_entity

    body = JSON.parse(response.body).deep_symbolize_keys

    body => {
      "status": "error",
      "message": "Invalid Order",
      "details": ["Customer must exist"]
    }
  end

  test "should not create order with invalid restaurant_id" do
    post api_v1_restaurant_orders_path(-1), params: {
      order: {
        phone: @customer.phone,
        restaurant_id: -1,
        meal_box_id: @meal_box.id,
        quantity: 2
      }
    }, headers: { "Authorization" => "Token #{@user.api_access_token}" }, as: :json

    assert_response :unprocessable_entity

    body = JSON.parse(response.body).deep_symbolize_keys

    body => {
      "status": "error",
      "message": "Invalid Order",
      "details": ["Customer must exist"]
    }
  end

  test "should not create order with invalid meal_box_id" do
    post api_v1_restaurant_orders_path(@restaurant), params: {
      order: {
        phone: @customer.phone,
        restaurant_id: @restaurant.id,
        meal_box_id: -1,
        quantity: 2
      }
    }, headers: { "Authorization" => "Token #{@user.api_access_token}" }, as: :json

    assert_response :internal_server_error

    body = JSON.parse(response.body).deep_symbolize_keys

    body => {
      "status": "error",
       "message": "Couldn't find MealBox with 'id'=-1",
       "details": {}
    }
  end

  test "should not create order with invalid quantity" do
    post api_v1_restaurant_orders_path(@restaurant), params: {
      order: {
        phone: @customer.phone,
        restaurant_id: @restaurant.id,
        meal_box_id: @meal_box.id,
        quantity: 0
      }
    }, headers: { "Authorization" => "Token #{@user.api_access_token}" }, as: :json

    assert_response :unprocessable_entity
  end
end
