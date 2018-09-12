class ChangeOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :datetime
    add_column :orders, :created_at, :datetime, null: false
    add_column :orders, :updated_at, :datetime, null: false
  end
end
