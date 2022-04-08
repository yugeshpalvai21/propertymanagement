class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :size
      t.decimal :price, precision: 10, scale: 2
      t.integer :year_built

      t.timestamps
    end
  end
end
