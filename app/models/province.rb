class Province < ApplicationRecord
  has_many :customers, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  validates :gst_rate, :pst_rate, :hst_rate,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 100
            }
end