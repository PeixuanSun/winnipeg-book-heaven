class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  private

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
