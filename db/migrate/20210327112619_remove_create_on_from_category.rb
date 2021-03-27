class RemoveCreateOnFromCategory < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :created_on, :datetime
    remove_column :menu_items, :created_on, :datetime
    remove_column :users, :created_on, :datetime
  end
end
