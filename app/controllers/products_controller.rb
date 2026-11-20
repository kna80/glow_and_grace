class ProductsController < ApplicationController
  def index
    @categories = Category.order(:name)

    @products = Product.includes(:category)
                       .where(active: true)

    # Search by name or description
    if params[:search].present?
      keyword = "%#{Product.sanitize_sql_like(params[:search].strip.downcase)}%"

      @products = @products.where(
        "LOWER(products.name) LIKE :keyword OR LOWER(products.description) LIKE :keyword",
        keyword: keyword
      )
    end

    # Category filter
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end

    # New Arrivals / Recently Updated
    case params[:filter]
    when "new"
      @products = @products.where(
        "products.created_at >= ?", 3.days.ago
      )
    when "updated"
      @products = @products.where(
        "products.updated_at >= ? AND products.created_at < ?",
        3.days.ago,
        3.days.ago
      )
    end

    # Sort and paginate
    @products = @products.order(created_at: :desc, id: :desc)
                         .page(params[:page])
                         .per(12)
  end

  def show
    @product = Product.includes(:category)
                      .where(active: true)
                      .find(params[:id])
  end
end