class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :description
      t.datetime :time
      t.string :duration
      t.integer :subject_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
