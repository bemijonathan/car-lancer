class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :description
      t.string :bid

      t.timestamps
    end
  end
end
