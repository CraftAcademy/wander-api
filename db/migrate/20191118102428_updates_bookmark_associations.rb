class UpdatesBookmarkAssociations < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookmarks, :trail_id

    add_reference :trails, :bookmark, foreign_key: true
    add_reference :users, :bookmark, foreign_key: true

    create_join_table :trails, :bookmarks do |t|
      t.index [:trail_id, :bookmark_id]
      t.index [:bookmark_id, :trail_id]
    end
  end  
end
