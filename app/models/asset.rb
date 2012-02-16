class Asset < ActiveRecord::Base
  belongs_to :person
  attr_accessible :name, :description

  validates :name, :presence => true, :uniqueness => true
end
