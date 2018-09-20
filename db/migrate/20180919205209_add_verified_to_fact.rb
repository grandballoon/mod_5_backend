class AddVerifiedToFact < ActiveRecord::Migration[5.2]
  def change
    add_column :facts, :verified, :boolean, default: false
  end
end
