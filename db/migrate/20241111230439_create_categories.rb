class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :decription
      t.string :text

      t.timestamps
    end
  end
end
