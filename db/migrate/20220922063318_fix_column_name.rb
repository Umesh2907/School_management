class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :standards, :standard, :class_room
  end
end
