class RemoveColumnFromRooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :user_id
  end
end
