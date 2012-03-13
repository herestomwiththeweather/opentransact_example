class Asset < ActiveRecord::Base
  belongs_to :person
  has_many :transacts
  attr_accessible :name, :description
  attr_readonly :name

  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true, :uniqueness => true
end
