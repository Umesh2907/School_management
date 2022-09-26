class AddColumnsStandards < ActiveRecord::Migration[5.2]
  def change
    add_column :standards, :school_id, :integer
  end
end
