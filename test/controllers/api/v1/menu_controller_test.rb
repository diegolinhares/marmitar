require "test_helper"

class Api::V1::MenusControllerTest < ::ActionDispatch::IntegrationTest
  test "should get Wednesday's menu" do
    travel_to ::Date.new(2024, 6, 26) do
      get api_v1_menus_url,
          headers: { "Authorization" => "Token #{users(:one).api_access_token}" }

      assert_response :success

      response_json = ::JSON.parse(response.body)

      normalized_response = response_json.map do |meal_box|
        {
          "name" => meal_box["name"],
          "description" => meal_box["description"],
          "formatted_price" => meal_box["formatted_price"],
          "ingredients" => meal_box["ingredients"].map { |ingredient| ingredient.except("id") }
        }
      end

      expected_output = [
        {
          "name" => "Quentinha Básica I",
          "description" => "A mais pedida do bairro",
          "formatted_price" => "R$15.99",
          "ingredients" => [
            { "name" => "Feijão" },
            { "name" => "Salada" },
            { "name" => "Arroz" }
          ]
        },
        {
          "name" => "Quentinha Básica II",
          "description" => "Essa é a nossa mais saborosa",
          "formatted_price" => "R$21.99",
          "ingredients" => [
            { "name" => "Feijão" },
            { "name" => "Batata-frita" },
            { "name" => "Arroz" }
          ]
        }
      ]

      assert_equal expected_output, normalized_response
    end
  end
end
