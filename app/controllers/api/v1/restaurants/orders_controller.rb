module Api::V1
  class Restaurants::OrdersController < BaseController
    before_action :authenticate_user!

    def create
      customer = ::Customer.find_by(
        phone: order_params[:phone],
        restaurant_id: params[:restaurant_id]
      )

      meal_box = ::MealBox.find(order_params[:meal_box_id])

      quantity = Integer(order_params[:quantity])

      total_price = quantity * meal_box.price

      order = ::Order.new(
        customer:,
        meal_box:,
        quantity:,
        total_price:,
        status: :pending
      )

      if order.save
        render_json_with_success(status: :created)
      else
        render_json_with_error(
          status: :unprocessable_entity,
          message: "Invalid Order",
          details: order.errors.full_messages
        )
      end
    end

    private

    def order_params
      params.require(:order).permit(:phone, :restaurant_id, :meal_box_id, :quantity)
    end
  end
end
