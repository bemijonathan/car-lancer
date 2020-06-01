class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.integer :user__id
      t.integer :mechanic__id
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
