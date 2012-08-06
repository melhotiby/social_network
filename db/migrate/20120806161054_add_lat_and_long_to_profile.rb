class AddLatAndLongToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :lat, :float, :precision => 10, :scale => 6
    add_column :profiles, :long, :float, :precision => 10, :scale => 6
  end
end
