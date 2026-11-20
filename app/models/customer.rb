class Customer < ApplicationRecord
  belongs_to :province

  has_many :orders, dependent: :restrict_with_error

  validates :name, :email, :address, presence: true

  validates :email,
            format: {
              with: URI::MailTo::EMAIL_REGEXP
            }
end