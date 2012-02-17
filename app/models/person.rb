class Person < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :username, :email, :password, :password_confirmation
  has_many :assets

  def transactions
    Transact.by_person(self)
  end
end
