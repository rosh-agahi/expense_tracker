class ChangeAmountToDecimal < ActiveRecord::Migration[6.1]
  def change
    remove_column :expenses, :amount, :integer
    add_column :expenses, :amount, :decimal, :precision => 9, :scale => 2
  end
end
