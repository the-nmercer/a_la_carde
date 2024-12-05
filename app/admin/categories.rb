ActiveAdmin.register Category do
  permit_params :name, :description, :text

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :name
      f.input :description
    end
    f.actions
  end

  filter :name
  filter :description
  filter :created_at
end
