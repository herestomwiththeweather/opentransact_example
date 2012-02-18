class Client < ActiveRecord::Base
  attr_accessible :name, :website, :redirect_uri
  belongs_to :person

  before_validation :setup, :on => :create
  validates :name, :redirect_uri, :person, :secret, :presence => true
  validates :identifier, :presence => true, :uniqueness => true

  private

  def setup
    self.identifier = SecureToken.generate(16)
    self.secret = SecureToken.generate
  end
end
