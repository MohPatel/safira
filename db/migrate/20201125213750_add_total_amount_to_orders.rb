class AddTotalAmountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :totalamount, :integer
  end
end
