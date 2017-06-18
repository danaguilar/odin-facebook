class FriendsFrienders < ActiveRecord::Migration[5.0]
  def change
    create_table :friends, id: false do |t|
      t.integer :friender_id, index: true
      t.integer :friend_id, index: true

      t.timestamps
    end
  end
end
