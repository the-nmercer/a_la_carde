class CartsController < ApplicationController
  before_action :initialize_cart

  def show
    @cart_items = current_cart.map do |product_id, quantity|
      product = Product.find(product_id)
      { product: product, quantity: quantity }
    end
  end

  def add_item
    product_id = params[:product_id]
    quantity = params[:quantity].to_i

    if quantity.positive?
      @cart[product_id] ||= 0
      @cart[product_id] += quantity
    end

    save_cart
    redirect_to cart_path, notice: 'Item added to cart.'
  end

  def update_item
    product_id = params[:product_id]
    quantity = params[:quantity].to_i

    if @cart[product_id]
      if quantity > 0
        @cart[product_id] = quantity
      else
        @cart.delete(product_id)
      end
    end

    save_cart
    redirect_to cart_path, notice: 'Cart updated.'
  end

  def remove_item
    product_id = params[:product_id]

    @cart.delete(product_id) if @cart[product_id]

    save_cart
    redirect_to cart_path, notice: 'Item removed from cart.'
  end

  def checkout
    redirect_to new_order_path
  end

  private

  def initialize_cart
    @cart = session[:cart] ||= {}
  end

  def save_cart
    session[:cart] = @cart
  end
end
