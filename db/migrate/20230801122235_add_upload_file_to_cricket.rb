class AddUploadFileToCricket < ActiveRecord::Migration[7.0]
  def change
  add_column :crickets, :phone_numbers, :text
  end
end
