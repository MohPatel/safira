class AddProvinceReferenceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :province, null: false, foreign_key: true
  end
end
