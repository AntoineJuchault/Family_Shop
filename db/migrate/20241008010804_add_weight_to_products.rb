class AddWeightToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :weight, :decimal
  end
end
