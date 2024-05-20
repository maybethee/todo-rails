class RemoveDefaultValueFromCategoryName < ActiveRecord::Migration[7.1]
  def change
    change_column_default :categories, :name, nil
  end
end
