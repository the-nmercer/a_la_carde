class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :order_items, dependent: :destroy

  enum status: { cart: 0, completed: 1, cancelled: 2 }

  def calculate_total_price
    self.total_price = order_items.sum { |item| item.quantity * item.price }
  end
end
