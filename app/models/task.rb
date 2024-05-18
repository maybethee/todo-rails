class Task < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  # must include inverse_of when submitting a POST form using a has_many through: relation apparently
  has_many :task_categories
  has_many :categories, through: :task_categories, dependent: :destroy
  # accepts_nested_attributes_for :task_categories

  def category_names
    self.categories.map { |category| category.name }.join(", ")
  end

  # simplify task form to just use category_names instead of nesting the form
  def category_names=(names)
    self.categories = names.split(',').map do |name|
      Category.where(name: name.strip).first_or_create!
    end
  end
end
