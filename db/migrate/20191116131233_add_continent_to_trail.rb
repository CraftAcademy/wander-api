class AddContinentToTrail < ActiveRecord::Migration[6.0]
  def change
    add_column :trails, :continent, :string
  end
end
