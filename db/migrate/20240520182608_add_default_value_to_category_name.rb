class AddDefaultValueToCategoryName < ActiveRecord::Migration[7.1]
  def change
    change_column_default :categories, :name, 'No tags'
  end
end
