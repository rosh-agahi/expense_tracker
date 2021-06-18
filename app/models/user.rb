class User < ActiveRecord::Base
  has_secure_password

  has_many :categories
  has_many :expenses, through: :categories

  validates_uniqueness_of(:username)

end
