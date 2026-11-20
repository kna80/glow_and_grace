class IncreaseProvinceTaxRatePrecision < ActiveRecord::Migration[7.2]
  def change
    change_column :provinces, :gst_rate, :decimal,
                  precision: 6, scale: 3, default: 0, null: false

    change_column :provinces, :pst_rate, :decimal,
                  precision: 6, scale: 3, default: 0, null: false

    change_column :provinces, :hst_rate, :decimal,
                  precision: 6, scale: 3, default: 0, null: false
  end
end