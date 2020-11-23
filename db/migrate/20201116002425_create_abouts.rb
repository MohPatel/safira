class CreateAbouts < ActiveRecord::Migration[6.0]
  def change
    create_table :abouts do |t|
      t.string :titile
      t.string :content

      t.timestamps
    end
  end
end
