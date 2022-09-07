class CreateClassRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :class_rooms do |t|
      t.string :standard
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
