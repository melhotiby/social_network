class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :miles_from
      t.string :gender
      t.integer :from_age
      t.integer :to_age
      t.string :hair_color
      t.string :nationality
      t.string :education
      t.string :religion
      t.string :religious_values
      t.text :about_them
      t.references :user

      t.timestamps
    end
  end
end
