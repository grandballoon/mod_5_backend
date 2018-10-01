class AddCategoryToFacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :facts, :category, foreign_key: true
  end
end
