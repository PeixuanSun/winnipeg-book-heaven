class Product < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["description", "title"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
