class Category < ActiveRecord::Base
  has_many :expenses
  belongs_to :user

  def expense_sum
    "$" + expenses.sum(:amount).to_s
  end

end
