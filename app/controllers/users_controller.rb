class UsersController < ApplicationController
  def index
    render plain: "hello"
  end

  def new
    render "users/new"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email:params[:email],
      password:params[:password]
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to "/"
    else
      flash[:error] = "The Details Filled Are Invalid, Please Try Again!"
      redirect_to new_user_path
    end


  end

end
