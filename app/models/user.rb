class User < ApplicationRecord
  has_secure_password
  validates :email , presence: true
  validates :password ,presence: true
  validates :name , presence: true
  validates :role ,presence: true
  has_many  :invoices

  def self.createNewUser(name, role, email, password)
    new_user = User.new(
      name: name,
      role: role,
      email:email,
      password:password
    )
    new_user
  end
end
