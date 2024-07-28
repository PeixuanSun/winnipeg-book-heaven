class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_one_attached :image

  validates :title, :author, :description, :price, :stock,  presence: true
  validates :price, :stock, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: true

  before_destroy :purge_image
  def purge_image
    image.purge if image.attached?
  end

  before_destroy :delete_product_categories
  def delete_product_categories
    product_categories.destroy_all if product_categories.any?
  end


  private

  def self.ransackable_attributes(auth_object = nil)
    ["author", "description", "id", "id_value", "price", "stock", "title","image_attachment_id","image_blob_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories", "product_categories"]
  end
end
