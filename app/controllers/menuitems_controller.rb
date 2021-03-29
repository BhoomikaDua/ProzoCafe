class MenuitemsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    new_menu_item = MenuItem.createMenuItem(params[:name], params[:description], params[:category_id], params[:price], params[:production_cost], params[:stock])
    if new_menu_item.save
      flash[:success] = "Menu Item Added!"
      redirect_to categories_path
    else
      flash[:error] = "The Details Filled Are Invalid, Please Try Again!"
      redirect_to "/categories/menuitem/new"
    end
  end

  def edit
    @menuitem = MenuItem.find(params[:id])
    render "edit"
  end

  def update
    id =  params[:id]
    menu_item = MenuItem.updateMenuItem(id, params[:name], params[:description], params[:category_id], params[:price], params[:production_cost], params[:stock])
    if menu_item.save
      flash[:success] = "Menu Item Updated!"
      redirect_to categories_path
    else
      flash[:error] = "Unable To Update The Menu Item, Please Try Again!"
      redirect_to "/categories/menuitem/new"
    end
  end

  def destroy
    id =  params[:id]
    MenuItem.destroy(id)
    flash[:success] = "Menu Item Deleted"
    redirect_to categories_path
  end

end
