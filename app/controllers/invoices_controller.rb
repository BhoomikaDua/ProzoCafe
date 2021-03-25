class InvoicesController < ApplicationController

  def index
    @current_user = current_user
    if(@current_user && @current_user.role == "customer")
      @invoices = Invoice.where(user_id: @current_user.id)
    else
      @invoices = Invoice.all
    end

    render "index"
  end

  def cart
    @current_user = current_user
    render "cart"
  end

  def create
    if(!session[:current_user_id])
      flash[:error] = "Please Login To Place an Order."
      redirect_to new_sessions_path
    elsif(session[:current_user_id] && session[:current_cart_invoice_id])
      menu_item_id = params[:id]
      menu_item = MenuItem.find(params[:id])

      new_cart_item = OrderItem.new(
      invoice_id: session[:current_cart_invoice_id],
      menu_item_id: menu_item.id,
      menu_item_price: menu_item.price,
      menu_item_production_cost: menu_item.production_cost,
      items_purchased: 1
      )
      if new_cart_item.save
        cart = Invoice.find(session[:current_cart_invoice_id])
        cart.total_bill = cart.total_bill + new_cart_item.menu_item_price
        cart.production_cost = cart.production_cost + new_cart_item.menu_item_production_cost
        cart.save
        flash[:success] = "Item is successfully added to the Cart!"
        redirect_to categories_path
      else
        flash[:error] = "We were unable to process your order, Please Try Again!"
        #render plain: new_user.errors.values
        redirect_to categories_path
      end

    else
      new_cart = Invoice.new(
        online_order: current_user.role == "customer",
        user_id: current_user.id,
        delivered: false,
        total_bill: 0,
        production_cost: 0,
        in_cart: true
      )

      if new_cart.save
        session[:current_cart_invoice_id] = new_cart.id
        create
      else
        flash[:error] = "We were unable to process your order, Please Try Again!"
        #render plain: new_user.errors.values
        redirect_to categories_path
      end
    end
  end

  def update
    id = params[:id]
    invoice = Invoice.find(id)
    invoice.in_cart = false
    invoice.save
    session[:current_cart_invoice_id] = nil

    redirect_to invoices_path
  end

  def deliver
    id = params[:id]
    invoice = Invoice.find(id)
    invoice.delivered = true
    invoice.save

    redirect_to invoices_path
  end

end
