class HomeController < ApplicationController
  def index
    @products = Product.all

    @new_products = Product.where('created_at >= ?', 3.days.ago).presence || []
    @recently_updated_products = Product.where('updated_at >= ?', 3.days.ago)
                                         .where('created_at < ?', 3.days.ago).presence || []

    @random_products = Product.all.sample(10)

    if params[:filter] == 'new'
      @products = @new_products
    elsif params[:filter] == 'recently_updated'
      @products = @recently_updated_products
    end
  end
end
