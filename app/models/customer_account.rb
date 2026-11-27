class CustomerAccount < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :province, optional: true

  validates :full_name, length: { maximum: 150 }, allow_blank: true
  validates :address, length: { maximum: 255 }, allow_blank: true
  validates :city, length: { maximum: 100 }, allow_blank: true
  validates :postal_code,
            format: { with: /\A[A-Za-z]\d[A-Za-z] ?\d[A-Za-z]\d\z/ },
            allow_blank: true
end