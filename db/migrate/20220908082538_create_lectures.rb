class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :description
      t.datetime :time
      t.string :duration
      t.integer :subject_code
      t.date :date
      t.integer :class_room_id

      t.timestamps
    end
  end
end
