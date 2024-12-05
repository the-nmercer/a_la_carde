class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer = current_customer

    if @order.save
      redirect_to order_confirmation_path(@order), notice: 'Your order was successfully placed.'
    else
      render :new, alert: 'There was an issue with your order.'
    end
  end

  private

  def order_params
    params.require(:order).permit(:total_price, :shipping_address, :billing_address, :province)
  end
end
