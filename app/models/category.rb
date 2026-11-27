class Category < ApplicationRecord
  has_many :products, dependent: :restrict_with_error

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 2, maximum: 100 }

  validates :description,
            length: { maximum: 1000 },
            allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id name description created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[products]
  end
end