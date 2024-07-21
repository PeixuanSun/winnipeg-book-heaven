class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories

  private

  def self.ransackable_attributes(auth_object = nil)
    ["author", "description", "id", "id_value", "price", "stock", "title"]
  end
end
