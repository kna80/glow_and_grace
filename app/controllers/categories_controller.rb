class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])

    @products = @category.products
                         .where(active: true)
                         .order(created_at: :desc)
  end
end