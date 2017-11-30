class AddColorToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :color, :string
  end
end
