class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :name
      t.integer :marks
      t.string :email
      t.string :confirmed_email
      t.boolean :terms
      t.timestamps
    end
  end
end
