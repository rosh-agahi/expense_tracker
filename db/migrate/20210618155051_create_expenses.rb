class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.integer :amount
      t.date :date
      t.string :vendor
      t.string :description
      t.integer :user_id
      t.integer :category_id
    end 
  end
end
