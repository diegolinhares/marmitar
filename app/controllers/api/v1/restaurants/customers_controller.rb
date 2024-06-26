module Api::V1
  class Restaurants::CustomersController < BaseController
    before_action :authenticate_user!

    def create
      customer = ::Customer.new(
        name: customer_params[:name],
        phone: customer_params[:phone],
        restaurant_id: params[:restaurant_id]
      )

      if customer.save
        render_json_with_success(status: :created)
      else
        render_json_with_error(
          status: :unprocessable_entity,
          message: "Invalid Customer",
          details: customer.errors.full_messages
        )
      end
    end

    private

    def customer_params
      params.require(:customer).permit(:name, :phone)
    end
  end
end
