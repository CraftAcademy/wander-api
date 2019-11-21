class AddValueToLike < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :value, :integer, default: 0
  end
end
