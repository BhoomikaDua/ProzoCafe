class MenuitemsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    new_menu_item = MenuItem.createMenuItem(params[:name], params[:description], params[:category_id], params[:price], params[:production_cost])
    if new_menu_item.save
      redirect_to categories_path
    else
      flash[:error] = "The Details Filled Are Invalid, Please Try Again!"
    end

  end

end
