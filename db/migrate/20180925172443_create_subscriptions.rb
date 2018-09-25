class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :fact_id
      t.integer :user_id
      t.integer :position

      t.timestamps
    end
    add_index :subscriptions, [:user_id, :fact_id]
  end
end
