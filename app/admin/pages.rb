ActiveAdmin.register Page do
  permit_params :title, :content

  index do
    selectable_column
    id_column
    column :title
    column :content
    actions
  end

  form do |f|
    f.inputs "Page Details" do
      f.input :title
      f.input :content, as: :rich_text_area
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :content do |page|
        raw page.content
      end
    end
    active_admin_comments
  end
end
