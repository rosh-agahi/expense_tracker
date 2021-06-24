class Category < ActiveRecord::Base

  has_many :expenses
  belongs_to :user

  def expense_sum
    expenses.sum(:amount)
  end

  def expense_percent
    expense_sum * 100 / self.user.expenses.sum(:amount)
  end

end
