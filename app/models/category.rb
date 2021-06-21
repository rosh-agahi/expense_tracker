class Category < ActiveRecord::Base
  has_many :expenses
  belongs_to :user

  def expense_sum
    ActiveSupport::NumberHelper.number_to_currency(expenses.sum(:amount), :unit => "$")
  end

end
