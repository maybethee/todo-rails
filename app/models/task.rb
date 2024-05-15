class Task < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :task_categories
  has_many :categories, through: :task_categories
  accepts_nested_attributes_for :task_categories
end
