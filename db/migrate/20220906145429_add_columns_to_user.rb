class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
    add_column :users, :contact_number, :integer
    add_column :users, :address, :string
    add_column :users, :image, :string
    add_column :users, :role, :integer
    add_column :users, :custom_attr, :text
  end
end
