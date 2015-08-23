class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :description
      t.float :price
      t.belongs_to :business

      t.timestamps null: false
    end
  end
end
