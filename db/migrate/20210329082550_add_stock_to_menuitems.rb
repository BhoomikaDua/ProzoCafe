class AddStockToMenuitems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :stock, :bigint
  end
end
