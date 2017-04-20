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
    # extract channel_ids and remove empty strings
    hash_params = category_params.to_h
    ids =  hash_params[:channel_ids][:ids]
    ids.each  {|id| ids.delete(id) if id.blank? }

    @category = Category.new(category_params)
    @user = current_user
    @category.user = @user
    @category.update_channel_ids(ids)
    @category.save!

    redirect_to @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category)
      .permit(:name, :channel_ids => [ :ids => []])
    end

end
