class Province < ApplicationRecord
  has_many :customers, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  validates :gst_rate, :pst_rate, :hst_rate,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 100
            }

  def self.ransackable_attributes(auth_object = nil)
    %w[id name code gst_rate pst_rate hst_rate created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end