class ChangeColumnTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :custom_attr, 'json USING CAST(custom_attr AS json)'
  end
end
