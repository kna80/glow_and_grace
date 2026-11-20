class ProductsController < ApplicationController
  def index
    @categories = Category.order(:name)

    @products = Product.includes(:category)
                       .where(active: true)
                       .order(created_at: :desc)

    if params[:search].present?
      @products = @products.where(
        "LOWER(products.name) LIKE ?",
        "%#{params[:search].downcase}%"
      )
    end

    if params[:category_id].present?
      @products = @products.where(
        category_id: params[:category_id]
      )
    end
  end

  def show
    @product = Product.includes(:category)
                      .where(active: true)
                      .find(params[:id])
  end
end