ActiveAdmin.register Product do
  permit_params :name, :description, :category_id, :price, :stock_quantity

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :category
    column :price
    column :stock_quantity
    actions
  end

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :category, as: :select, collection: Category.all.collect { |c| [c.name, c.id] }
      f.input :price
      f.input :stock_quantity
    end
    f.actions
  end
end
