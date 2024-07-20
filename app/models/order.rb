class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy


  private

  def self.ransackable_associations(auth_object = nil)
    ["order_items", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "status", "total_price", "user_id"]
  end
end
