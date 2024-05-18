class Task < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  # must include inverse_of when submitting a POST form using a has_many through: relation apparently
  has_many :task_categories, inverse_of: :task
  has_many :categories, through: :task_categories, dependent: :destroy
  accepts_nested_attributes_for :task_categories
end
