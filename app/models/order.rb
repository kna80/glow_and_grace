class Order < ApplicationRecord
  belongs_to :customer, optional: true

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :customer_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :total, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }

  validates :status,
            inclusion: {
              in: %w[
                pending
                processing
                shipped
                delivered
                cancelled
              ]
            }

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      customer_id
      customer_name
      email
      address
      status
      subtotal
      gst_amount
      pst_amount
      hst_amount
      total
      created_at
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[
      customer
      order_items
    ]
  end
end