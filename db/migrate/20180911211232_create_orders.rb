class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.float :total
      t.string :status
      t.datetime :datetime
      t.references :user, foreign_key: true
    end
  end
end
