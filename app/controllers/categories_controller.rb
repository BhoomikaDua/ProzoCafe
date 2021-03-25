class CategoriesController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    @current_user = current_user
    render "index"
  end

  def new
  end

  def create
    new_category = Category.new(
      name: params[:name],
      is_active: params[:is_active],
      created_on: DateTime.now
    )
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
    category = Category.find(id)
    category.is_active = !!is_active
    category.save

    redirect_to categories_path
  end
end
