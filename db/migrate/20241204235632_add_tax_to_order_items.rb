class AddTaxToOrderItems < ActiveRecord::Migration[7.2]
  def change
    add_column :order_items, :pst, :decimal
    add_column :order_items, :gst, :decimal
    add_column :order_items, :hst, :decimal
  end
end
