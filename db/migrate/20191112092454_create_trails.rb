class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :title
      t.text :description
      t.integer :intensity
      t.string :extra
      t.integer :duration
      t.string :location

      t.timestamps
    end
  end
end
