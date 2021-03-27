class CategoriesController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    @current_user = current_user
    if(@current_user && @current_user.role == "admin")
      @categories = Category.all.order("id")
    else
      @categories = Category.where(is_active: true).order("id")
    end
    render "index"
  end

  def new
  end

  def create
    new_category = Category.createCategory(params[:name], params[:is_active])
    if new_category.save
      redirect_to categories_path
    else
      flash[:error] = "The Details Filled Are Invalid, Please Try Again!"
      redirect_to new_category_path
    end
  end

  def update
    id = params[:id]
    is_active = params[:is_active]
    Category.toggleActiveStatus(id, is_active)

    redirect_to categories_path
  end
end
