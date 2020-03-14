class CreateBiddings < ActiveRecord::Migration[6.0]
  def change
    create_table :biddings do |t|
      t.string :amount
      t.string :description

      t.timestamps
    end
  end
end
