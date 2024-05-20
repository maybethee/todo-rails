class Task < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :task_categories
  has_many :categories, through: :task_categories, dependent: :destroy

  def category_names
    self.categories.map { |category| category.name }.join(", ")
  end

  # simplify task form to just use category_names instead of nesting the form
  def category_names=(names)
    if names.blank?
      self.categories = [Category.where(name: 'No Tag').first_or_create!]
    else
      self.categories = names.split(',').map do |name|
        Category.where(name: name.strip).first_or_create!
      end
    end
  end
end
