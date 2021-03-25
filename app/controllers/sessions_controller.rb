class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    if(session[:current_user_id])
      flash[:error] = "You are already Logged In."
      redirect_to "/"
      return false
    end
    render "new"
  end

  def create
    user = User.find_by(email: params[:email])
    if(user && user.authenticate(params[:password]))
      session[:current_user_id] = user.id
      cart = Invoice.where(user_id: user.id.to_s, in_cart: true)
      if(cart.count > 0)
        session[:current_cart_invoice_id] = cart.first.id
      end

      redirect_to "/"
    else
      flash[:error] = "Your Login Attempt Was Invalid, Please Try Again."
      redirect_to new_sessions_path
    end
  end

  def destroy
    @current_user = nil
    session.clear
    redirect_to "/"
  end
end
