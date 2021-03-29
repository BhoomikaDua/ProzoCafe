class OrderItem < ApplicationRecord

  def self.createOrderItem(cart_invoice_id, menu_item)
    new_cart_item = OrderItem.new(
      invoice_id: cart_invoice_id,
      menu_item_id: menu_item.id,
      menu_item_price: menu_item.price,
      menu_item_production_cost: menu_item.production_cost,
      items_purchased: 1,
      menu_item_name: menu_item.name
      )
  end

  def self.updateOrderFrequency(id)
    OrderItem.where(invoice_id: id).map do |item|
      item = MenuItem.find(item.menu_item_id)
      item.ordering_frequency = item.ordering_frequency + 1
      item.save
    end
  end

  def self.itemInCart(invoice_id, item_id)
    OrderItem.where(invoice_id: invoice_id, menu_item_id: item_id).first
  end
end
