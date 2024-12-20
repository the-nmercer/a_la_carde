class Category < ApplicationRecord
  has_many :products

  def self.ransackable_associations(auth_object = nil)
    ["products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "created_at", "updated_at"]
  end
end
