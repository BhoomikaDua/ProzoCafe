class UsersController < ApplicationController
  def index
    render plain: "hello"
  end

  def new
    render "users/new"
  end

  def create
    new_user = User.new(
      name: params[:first_name],
      role: params[:role],
      email:params[:email],
      password_digest:params[:password]
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
