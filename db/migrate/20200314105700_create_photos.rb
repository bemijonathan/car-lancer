class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :name
      t.belongs_to :word, index: true


      t.timestamps
    end
  end
end
