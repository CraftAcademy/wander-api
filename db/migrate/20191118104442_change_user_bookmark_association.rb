class ChangeUserBookmarkAssociation < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :users, :bookmarks
    add_reference :bookmarks, :users, foreign_key: true
    
  end
end
