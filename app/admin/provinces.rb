ActiveAdmin.register Province do
  menu label: "Province Tax Rates"

  actions :index, :show, :edit, :update

  permit_params :gst_rate, :pst_rate, :hst_rate

  config.sort_order = "name_asc"

  index do
    column :name
    column :code
    column :gst_rate
    column :pst_rate
    column :hst_rate
    actions
  end

  filter :name
  filter :code

  form do |f|
    f.semantic_errors

    f.inputs "Province Tax Rates" do
      f.input :name, input_html: { disabled: true }
      f.input :code, input_html: { disabled: true }
      f.input :gst_rate
      f.input :pst_rate
      f.input :hst_rate
    end

    f.actions
  end
end