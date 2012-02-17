class Asset < ActiveRecord::Base
  belongs_to :person
  has_many :transacts
  attr_accessible :name, :description

  validates :name, :presence => true, :uniqueness => true
end
