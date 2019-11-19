class RenameLocationAndAddCountryCityToTrails < ActiveRecord::Migration[6.0]
  def change
    rename_column :trails, :location, :country
    add_column :trails, :city, :string
  end
end