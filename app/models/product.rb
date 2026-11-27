class Product < ApplicationRecord

  validate :acceptable_image

  def acceptable_image
    return unless image.attached?

    unless image.content_type.in?(%w[image/jpeg image/png image/webp])
      errors.add(:image, "must be a JPG, PNG or WEBP image")
    end

    if image.byte_size > 5.megabytes
      errors.add(:image, "must be smaller than 5 MB")
    end
  end


  has_one_attached :image do |attachable|
    attachable.variant :thumbnail, resize_to_limit: [300, 300]
    attachable.variant :large, resize_to_limit: [800, 800]
  end
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

  def self.ransackable_attributes(auth_object = nil)
    %w[id name description price stock_quantity category_id active created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end
end