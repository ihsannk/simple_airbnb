class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
        t.string :property_name,  null: false
        t.string :description,  null: false
        t.string :price,  null: false
        t.integer :user_id

        t.timestamps null: false
    end
  end
end