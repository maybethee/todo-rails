class TaskCategory < ApplicationRecord
  belongs_to :task
  belongs_to :category
  # must add accepts nested attributes line on BOTH Task and TaskCategory
  accepts_nested_attributes_for :category
end