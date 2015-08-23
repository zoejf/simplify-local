class AddShowPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :show_price, :float
  end
end
