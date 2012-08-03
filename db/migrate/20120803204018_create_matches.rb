class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.location :miles_from
      t.string :gender
      t.integer :age
      t.string :hair_color
      t.string :nationality
      t.string :education
      t.string :religion
      t.string :religious_values
      t.text :about_them

      t.timestamps
    end
  end
end
