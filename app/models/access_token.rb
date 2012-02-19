class AccessToken < ActiveRecord::Base
  belongs_to :person
  scope :valid, lambda { where('expires_at > ?', Time.now.utc) }

  def to_mac_token
    mac_token = Rack::OAuth2::AccessToken::MAC.new(
      :access_token  => self.token,
      :mac_key       => self.secret,
      :mac_algorithm => self.algorithm,
      :expires_in    => self.expires_in
    )
  end

  def expires_in
    (expires_at - Time.now.utc).to_i
  end
end
