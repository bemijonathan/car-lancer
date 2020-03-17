class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :description
      t.string :title
      t.integer :amount
      t.string :location

      t.timestamps
    end
  end
end
