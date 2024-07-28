class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  validates :name, presence: true
  validates :name, uniqueness: true

  private

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["product_categories", "products"]
  end
end
