class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trail, null: false, foreign_key: true
      t.column :value, :integer, :default => 0
      t.timestamps
    end
  end
end
