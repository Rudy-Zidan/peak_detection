class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.float :value, precision: 4, scale: 2
      t.timestamps
    end
  end
end
