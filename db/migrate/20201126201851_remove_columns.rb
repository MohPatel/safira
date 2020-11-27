class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :customer
    remove_column :customers, :province
  end
end
