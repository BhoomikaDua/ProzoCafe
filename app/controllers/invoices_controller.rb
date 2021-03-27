class InvoicesController < ApplicationController

  def index
    @current_user = current_user
    if(@current_user && @current_user.role == "customer")
      @invoices = Invoice.where(user_id: @current_user.id, in_cart: false)
    else
      @invoices = Invoice.where(in_cart: false)
    end

    render "index"
  end

  def cart
    @current_user = current_user
    render "cart"
  end

  def create
    if(!session[:current_user_id])
      #If User not Logged in
      flash[:error] = "Please Login To Place an Order."
      redirect_to new_sessions_path
    elsif(session[:current_user_id] && session[:current_cart_invoice_id])
      #Adding Order Item to the Invoice
      menu_item_id = params[:id]
      menu_item = MenuItem.find(params[:id])
      new_cart_item = OrderItem.createOrderItem(session[:current_cart_invoice_id], menu_item)

      if new_cart_item.save
        cart = Invoice.find(session[:current_cart_invoice_id])
        #Adding Price and Production Cost to the Invoice
        Invoice.updatePrice(cart, new_cart_item)
        flash[:success] = "Item successfully added to the Cart!"
        redirect_to categories_path
      else
        flash[:error] = "We were unable to process your order, Please Try Again!"
        redirect_to categories_path
      end

    else
      #If invoice doesnt exist, then we create a new Invoice
      new_cart = Invoice.createInvoice(current_user)
      if new_cart.save
        session[:current_cart_invoice_id] = new_cart.id
        create
      else
        flash[:error] = "Unable to process your order, Please Try Again!"
        redirect_to categories_path
      end
    end
  end

  def update
    id = params[:id]
    Invoice.checkout(id)
    OrderItem.updateOrderFrequency(id)
    session[:current_cart_invoice_id] = nil

    redirect_to invoices_path
  end

  def deliver
    id = params[:id]
    Invoice.deliverOrder(id)

    redirect_to invoices_path
  end

end
