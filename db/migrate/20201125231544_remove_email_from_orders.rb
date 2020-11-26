class RemoveEmailFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :email, :string
  end
end
