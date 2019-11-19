class AddsLatitudeLongitudeToCoordinates < ActiveRecord::Migration[6.0]
  def change
    add_column :coordinates, :latitude, :float, null: false
    add_column :coordinates, :longitude, :float, null: false
  end
end
