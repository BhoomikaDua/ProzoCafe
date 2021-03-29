class AddMenuNameToOrderitems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :menu_item_name, :string
  end
end
