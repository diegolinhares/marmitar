class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :api_access_token, null: false

      t.timestamps
    end

    add_index :meal_boxes, :email, unique: true
  end
end
