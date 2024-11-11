class RenameDecriptionToDescriptionInCategories < ActiveRecord::Migration[7.2]
  def change
    rename_column :categories, :decription, :description
  end
end
