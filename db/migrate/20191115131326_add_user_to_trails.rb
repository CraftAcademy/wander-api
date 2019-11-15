class AddUserToTrails < ActiveRecord::Migration[6.0]
  def change
    add_reference :trails, :user, foreign_key: true
  end
end
