class ChangeColumnTypeOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :totalamount, :decimal, :precision => 8, :scale => 2
  end
end
