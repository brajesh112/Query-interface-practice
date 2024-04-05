class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.text :house
      t.text :street
      t.text :landmark
      t.text :city
      t.text :state
      t.text :pincode
      t.text :country
      t.references :cricket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
