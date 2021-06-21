class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates_presence_of :amount, :category
  validates :amount, format: { with: /\d{1,8}\.\d\d/ }

end
