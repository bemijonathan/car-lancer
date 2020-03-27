class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.string :table_id
      t.integer :reciever_id
      t.string :content
      t.string :sender_class
      t.string :reciever_class

      t.timestamps
    end
  end
end
