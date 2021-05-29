class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    @current_user = current_user
    render "users/new"
  end

  def create
    @current_user = current_user

    if(params[:phone].length != 10)
      flash[:error] = "Invalid Phone Number!"
      redirect_to new_user_path
      return
    end

    new_user = User.createNewUser(params[:name], params[:role], params[:email], params[:password], params[:phone], params[:address])
    if new_user.save
      if(new_user.role == "customer")
        session[:current_user_id] = new_user.id
      end
      redirect_to "/"
    else
      flash[:error] = "The Details Filled Are Invalid, Please Try Again!"
      redirect_to new_user_path
    end
  end
end
