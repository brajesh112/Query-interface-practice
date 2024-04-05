class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
    	t.string :name
    	t.string :user_name
    	t.integer :role
    	t.string :email
    	t.string :password
    	t.integer :age
      t.timestamps
    end
  end
end
