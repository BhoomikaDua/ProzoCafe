class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    @current_user = current_user
    render "users/new"
  end

  def create
    new_user = User.new(
      name: params[:first_name],
      role: params[:role],
      email:params[:email],
      password:params[:password]
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to "/"
    else
      flash[:error] = "The Details Filled Are Invalid, Please Try Again!"
      #render plain: new_user.errors.values
      redirect_to new_user_path
    end
  end

end
