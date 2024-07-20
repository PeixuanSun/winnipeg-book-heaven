class Product < ApplicationRecord

  private

  def self.ransackable_attributes(auth_object = nil)
    ["author", "description", "id", "id_value", "price", "stock", "title"]
  end
end
