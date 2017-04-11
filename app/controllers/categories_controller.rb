class CategoriesController < ApplicationController

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @subscriptions = current_user.subscriptions
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    puts "saving category"
    @user = User.find(1)
    @category.user = @user

    @category.save
    redirect_to @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(
        :name)
    end

end
