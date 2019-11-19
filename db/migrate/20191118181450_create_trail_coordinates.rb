class CreateTrailCoordinates < ActiveRecord::Migration[6.0]
  def change
    execute 'CREATE EXTENSION IF NOT EXISTS hstore'
    create_table :trail_coordinates do |t|
      t.references :trail, null: false, foreign_key: true
      t.hstore :data

      t.timestamps
    end
  end
end
