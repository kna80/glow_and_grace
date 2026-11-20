class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true,
                   length: { minimum: 2, maximum: 150 }

  validates :description, presence: true

  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }

  validates :stock_quantity, presence: true,
                             numericality: {
                               only_integer: true,
                               greater_than_or_equal_to: 0
                             }

  validates :active, inclusion: { in: [true, false] }
end