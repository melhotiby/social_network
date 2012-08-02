class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.datetime :dob
      t.string :gender
      t.integer :age
      t.string :hair_color
      t.string :nationality
      t.string :education
      t.string :religion
      t.string :religious_values
      t.text :about_me
      t.string :country
      t.references :user

      t.timestamps
    end
  end
end
