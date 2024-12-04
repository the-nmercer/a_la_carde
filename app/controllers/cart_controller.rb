class CartController < ApplicationController
  def index
    @cart_items = current_cart.map do |product_id, quantity|
      product = Product.find(product_id)
      { product: product, quantity: quantity, total_price: product.price * quantity }
    end
  end

  def show
    @cart_items = current_cart.map do |product_id, quantity|
      product = Product.find(product_id)
      { product: product, quantity: quantity, total_price: product.price * quantity }
    end
  end

  def add_to_cart
    product_id = params[:product_id].to_i
    quantity = params[:quantity].to_i

    if current_cart[product_id]
      current_cart[product_id] += quantity
    else
      current_cart[product_id] = quantity
    end

    redirect_to cart_index_path, notice: 'Product added to cart!'
  end

  def update_quantity
    product_id = params[:product_id].to_i
    quantity = params[:quantity].to_i

    if quantity > 0
      current_cart[product_id] = quantity
    else
      current_cart.delete(product_id)
    end

    redirect_to cart_index_path, notice: 'Cart updated!'
  end

  def remove_from_cart
    product_id = params[:product_id].to_i
    current_cart.delete(product_id)

    redirect_to cart_index_path, notice: 'Product removed from cart!'
  end

  def checkout

  end
end
