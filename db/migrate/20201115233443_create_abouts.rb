class CreateAbouts < ActiveRecord::Migration[6.0]
  def change
    create_table :abouts do |t|
      t.string :name
      t.string :address
      t.string :contactno
      t.string :email

      t.timestamps
    end
  end
end
