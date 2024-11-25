class ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:filter] == 'new'
      @products = @products.where('created_at >= ?', 3.days.ago)
    elsif params[:filter] == 'recently_updated'
      @products = @products.where('updated_at >= ?', 3.days.ago)
      @products = @products.where('created_at < ?', 3.days.ago)
    end
  end

  def show
    @product = Product.find_by(id: params[:id])

    unless @product
      redirect_to products_path, alert: 'Product not found'
    end
  end
end
