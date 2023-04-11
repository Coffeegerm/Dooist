class Project < ApplicationRecord
  validates_presence_of :name

  belongs_to :user, optional: true
  has_many :todo_items, dependent: :destroy
end
