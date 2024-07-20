class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def self.ransortable_attributes(auth_object = nil)
    column_names - ["encrypted_password"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ransortable_attributes + _ransackers.keys
  end
end
