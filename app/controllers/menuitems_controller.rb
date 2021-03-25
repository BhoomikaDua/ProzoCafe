class MenuitemsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    new_menu_item = MenuItem.new(
      name: params[:name],
      description: params[:description],
      category_id: params[:category_id],
      price: params[:price],
      ordering_frequency: 0,
      production_cost: params[:production_cost],
      created_on: DateTime.now
    )

    if new_menu_item.save
      redirect_to categories_path
    else
      flash[:error] = "The Details Filled Are Invalid, Please Try Again!"
    end

  end

end
