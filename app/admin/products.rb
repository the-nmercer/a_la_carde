ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, :category_id, :image

  filter :name
  filter :description
  filter :category
  filter :price
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :category
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :category
    column :price
    column :stock_quantity
    column "Image" do |product|
      if product.image.attached?
        image_tag product.image.variant(resize_to_limit: [100, 100]).processed
      else
        "No image"
      end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock_quantity
      row :category
      row :image do |product|
        if product.image.attached?
          image_tag product.image.variant(resize_to_limit: [300, 300]).processed, alt: "Product Image"
        else
          "No image"
        end
      end
    end
    active_admin_comments
  end
end
