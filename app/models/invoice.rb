class Invoice < ApplicationRecord
  belongs_to :user
  has_many :orderitems

  def self.createInvoice(current_user)
    new_cart = Invoice.new(
        online_order: current_user.role == "customer",
        user_id: current_user.id,
        delivered: false,
        total_bill: 0,
        production_cost: 0,
        in_cart: true
      )
    new_cart
  end

  def self.deliverOrder(id)
    invoice = Invoice.find(id)
    invoice.delivered = true
    invoice.save
  end

  def self.checkout(id)
    invoice = Invoice.find(id)
    invoice.in_cart = false
    invoice.save
  end

  def self.updatePrice(cart, new_cart_item, action)
    if(action == "add")
      cart.total_bill = cart.total_bill + new_cart_item.menu_item_price
      cart.production_cost = cart.production_cost + new_cart_item.menu_item_production_cost
      cart.save
    end
    if(action == "remove")
      cart.total_bill = cart.total_bill - new_cart_item.menu_item_price
      cart.production_cost = cart.production_cost - new_cart_item.menu_item_production_cost
      cart.save
    end
  end

  def self.pendingOrders
    all.where(delivered: false).order("updated_at DESC")
  end

  def self.deliveredOrders
    all.where(delivered: true).order("updated_at DESC")
  end

  def self.productionCost
    Invoice.where(delivered: true).sum(:production_cost)
  end

  def self.totalBill
    Invoice.where(delivered: true).sum(:total_bill)
  end
end
