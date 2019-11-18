class RemoveLatitudeLongitudeFromTrail < ActiveRecord::Migration[6.0]
  def change

    remove_column :trails, :latitude, :float

    remove_column :trails, :longitude, :float
  end
end
