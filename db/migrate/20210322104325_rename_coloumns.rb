class RenameColoumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :category_id, :id
    remove_column :invoices, :invoice_id, :id
    remove_column :menu_items, :item_id, :id
    remove_column :order_items, :item_id, :id
    remove_column :users, :user_id, :id
  end
end
