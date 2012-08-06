class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user
      t.string :name
      t.string :photo

      t.timestamps
    end
  end
end
