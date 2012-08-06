class AddStateCityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :city, :string
    add_column :profiles, :state_or_providence, :string
  end
end
