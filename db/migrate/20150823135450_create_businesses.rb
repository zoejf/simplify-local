class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
    	t.string :name
    	t.string :category
    	t.string :address
    	t.string :phone
    	t.string :website
    	t.string :description
    	t.string :merch_assoc
    	t.float :lat
    	t.float :lng

      t.timestamps null: false
    end
  end
end
