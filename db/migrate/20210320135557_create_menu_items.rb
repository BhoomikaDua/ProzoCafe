class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.bigint :item_id
      t.string :name
      t.text :description
      t.string :category_id
      t.bigint :price
      t.bigint :ordering_frequency
      t.datetime :created_on
      t.bigint :production_cost

      t.timestamps
    end
  end
end
