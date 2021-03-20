class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.bigint :item_id
      t.bigint :invoice_id
      t.bigint :menu_item_id
      t.bigint :menu_item_price
      t.bigint :menu_item_production_cost
      t.bigint :items_purchased

      t.timestamps
    end
  end
end
