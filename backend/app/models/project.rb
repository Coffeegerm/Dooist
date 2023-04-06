class Project < ApplicationRecord
  validates_presence_of :name

  has_many :todo_items, dependent: :destroy
end
