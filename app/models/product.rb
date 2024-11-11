class Product < ApplicationRecord
  belongs_to :category

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "category_id", "price", "stock_quantity", "created_at", "updated_at"]
  end

  validates :name, presence: true
end
