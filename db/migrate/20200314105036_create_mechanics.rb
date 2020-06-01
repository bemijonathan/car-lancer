class CreateMechanics < ActiveRecord::Migration[6.0]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :bussinessname
      t.string :photo
      t.string :location
      t.string :password

      t.timestamps
    end
  end
end
