class CreatePropertyTags < ActiveRecord::Migration
  def change
    create_table :property_tags do |t|
      t.integer :property_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
