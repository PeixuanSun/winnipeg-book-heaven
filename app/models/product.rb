class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_one_attached :image

  validates :title, :author, :description, :price, :stock,  presence: true
  validates :price, :stock, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: true

  private

  def self.ransackable_attributes(auth_object = nil)
    ["author", "description", "id", "id_value", "price", "stock", "title","image_attachment_id","image_blob_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories", "product_categories"]
  end
end
