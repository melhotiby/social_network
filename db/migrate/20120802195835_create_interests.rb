class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :interesting_id

      t.timestamps
    end

    add_index :interests, :interesting_id
    add_index :interests, :user_id
    add_index :interests, [:user_id, :interesting_id], unique: true
  end
end
