class User < ApplicationRecord
  has_secure_password
  validates :email , presence: true
  validates :password ,presence: true
  validates :name , presence: true
  validates :role ,presence: true
  has_many  :invoices
end
