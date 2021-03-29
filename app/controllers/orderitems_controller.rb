class OrderitemsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def update
    invoice_id = session[:current_cart_invoice_id]
    menu_item_id = params[:id]
    order_item = OrderItem.itemInCart(invoice_id, menu_item_id)
    cart = Invoice.find(invoice_id)

    if(params[:itemAction] == "add")
      if(MenuItem.find(menu_item_id).stock == 0)
        flash[:error] = "We are out of stock!"
        redirect_to categories_path
        return false
      end

      order_item.items_purchased = order_item.items_purchased + 1
      order_item.save
      Invoice.updatePrice(cart, order_item, "add")
      #Updating Stock
      MenuItem.updateStock(menu_item_id , "remove")
      flash[:success] = "Item Successfully Added To The Cart!"
      redirect_to categories_path
    end

    if(params[:itemAction] == "remove")
      order_item.items_purchased = order_item.items_purchased - 1
      order_item.save
      Invoice.updatePrice(cart, order_item, "remove")
      #Updating Stock
      MenuItem.updateStock(menu_item_id , "add")
      flash[:success] = "Item Successfully Removed From The Cart"

      if(order_item.items_purchased == 0)
        OrderItem.destroy(order_item.id)
      end
      redirect_to categories_path
    end
  end
end
