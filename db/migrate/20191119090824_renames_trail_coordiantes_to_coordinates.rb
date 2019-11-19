class RenamesTrailCoordiantesToCoordinates < ActiveRecord::Migration[6.0]
  def change
    rename_table :trail_coordinates, :coordinates
  end
end
