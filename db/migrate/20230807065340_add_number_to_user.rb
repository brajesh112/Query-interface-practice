class AddNumberToUser < ActiveRecord::Migration[7.0]
  def change
  	add_column :users, :number, :text, array: true, default: []
  end
end
