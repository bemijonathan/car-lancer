class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :sender_class
      t.belongs_to :conversation, index: true

      t.timestamps
    end
  end
end
