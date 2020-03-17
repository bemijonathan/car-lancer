class CreateBiddings < ActiveRecord::Migration[6.0]
  def change
    create_table :biddings do |t|
      t.string :amount
      t.string :description
      t.belongs_to :work
      t.belongs_to :mechanic, index: true

      t.timestamps
    end
  end
end
