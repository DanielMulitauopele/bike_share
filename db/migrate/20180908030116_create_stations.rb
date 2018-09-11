class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :dock_count
      t.string :city
      t.string :installation_date
      t.string :slug

      t.timestamps
    end
  end
end
