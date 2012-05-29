class Client < ActiveRecord::Base
  attr_accessible :name, :description, :website, :redirect_uri
  has_many :access_tokens
  has_many :refresh_tokens
  belongs_to :person

  before_validation :setup, :on => :create
  validates :name, :redirect_uri, :secret, :presence => true
  validates :identifier, :presence => true, :uniqueness => true

  def as_json
    {:client_id => identifier, :client_secret => secret, :redirect_url => redirect_uri, :issued_at => created_at}.as_json
  end

  private

  def setup
    self.identifier = SecureToken.generate(16)
    self.secret = SecureToken.generate
  end
end
