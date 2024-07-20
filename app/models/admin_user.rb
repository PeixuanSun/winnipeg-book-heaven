class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :rememberable, :validatable


  def self.ransackable_attributes(auth_object = nil)
    ["email"]
  end
end
