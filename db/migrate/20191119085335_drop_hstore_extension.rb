class DropHstoreExtension < ActiveRecord::Migration[6.0]
  def change

    remove_column :trail_coordinates, :data, :hstore

    execute 'DROP EXTENSION hstore';
  end
end
