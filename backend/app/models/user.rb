class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 6 }, on: :create

  has_many :projects, dependent: :destroy
  has_many :todo_items, dependent: :destroy
end
