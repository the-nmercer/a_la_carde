class AddTaxesToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :taxes, :decimal
    add_column :orders, :pst, :decimal
    add_column :orders, :gst, :decimal
    add_column :orders, :hst, :decimal
    add_column :orders, :address, :string
    add_column :orders, :province, :string
  end
end
