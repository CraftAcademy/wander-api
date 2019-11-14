class AddCoordinatesToTrails < ActiveRecord::Migration[6.0]
  def change
    add_column :trails, :latitude, :float, :nil => false
    add_column :trails, :longitude, :float, :nil => false
  end
end