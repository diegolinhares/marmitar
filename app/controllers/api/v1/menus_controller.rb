module Api::V1
  class MenusController < BaseController
    before_action :authenticate_user!

    def index
      meal_boxes = ::MealBox.joins(:meal_box_availabilities)
                            .where(meal_box_availabilities: {
                              day_of_week: ::Date.today.wday
                            })

      render json: meal_boxes.as_json(
            methods: [ :formatted_price ],
            include: {
              ingredients: { only: [ :id, :name, :ingredient_type, :description ] }
            },
            only: [ :id, :name, :description, :formatted_price, :currency ]
          )
    end
  end
end
