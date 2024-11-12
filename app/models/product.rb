class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  # Resize image after upload
  after_commit :resize_image, on: [:create, :update]

  private

  def resize_image
    return unless image.attached?

    # Create and save the resized image as a variant
    image.variant(resize_to_limit: [100, 100]).processed
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "price", "stock_quantity", "category_id", "created_at", "updated_at"]
  end

  validates :name, presence: true
end
