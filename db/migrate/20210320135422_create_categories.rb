class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.bigint :category_id
      t.string :name
      t.boolean :is_active
      t.datetime :created_on

      t.timestamps
    end
  end
end
