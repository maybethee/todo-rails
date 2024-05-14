class Task < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :user
  has_many :task_categories
  has_many :categories, through: :task_categories
end
