class CreateInvoices < ActiveRecord::Migration[7.2]
  def change
    create_table :invoices do |t|
      t.references :order, null: false, foreign_key: true
      t.decimal :total_price
      t.decimal :taxes
      t.string :status

      t.timestamps
    end
  end
end
