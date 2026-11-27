ActiveAdmin.register Product do
  permit_params :image, :name, :description, :price,
                :stock_quantity, :category_id, :active

  menu priority: 3

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :price
    column :stock_quantity
    column :active
    column :created_at
    actions
  end

  filter :name
  filter :category
  filter :price
  filter :active

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :category
      f.input :image, as: :file
      f.input :price
      f.input :stock_quantity
      f.input :active
    end

    f.actions
  end
end