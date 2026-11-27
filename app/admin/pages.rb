ActiveAdmin.register Page do
  permit_params :title, :slug, :content

  menu priority: 4

  index do
    selectable_column
    id_column
    column :title
    column :slug
    column :updated_at
    actions
  end

  filter :title
  filter :slug

  form do |f|
    f.inputs "Page Details" do
      f.input :title
      f.input :slug
      f.input :content, as: :text
    end
    f.actions
  end
end