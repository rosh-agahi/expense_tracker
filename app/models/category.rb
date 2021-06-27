class Category < ActiveRecord::Base

  has_many :expenses
  belongs_to :user

  validates_presence_of :name

  def expense_sum
    expenses.sum(:amount)
  end

  def expense_percent
    if expense_sum == 0
      0
    else
      expense_sum * 100 / self.user.expenses.sum(:amount)
    end 
  end

end
