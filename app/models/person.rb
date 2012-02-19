class Person < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :username, :email, :password, :password_confirmation
  has_many :assets
  has_many :clients
  has_many :authorization_codes
  has_many :access_tokens

  def transactions
    Transact.by_person(self)
  end
end
