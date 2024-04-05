class AddLockVersionToForm < ActiveRecord::Migration[7.0]
  def change
    add_column :forms, :lock_version, :integer
  end
end
