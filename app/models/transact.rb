class Transact < ActiveRecord::Base
  attr_accessible :to, :amount, :note, :for, :redirect_uri
  belongs_to :asset
  belongs_to :payer, :class_name => "Person", :foreign_key => "payer_id"
  belongs_to :payee, :class_name => "Person", :foreign_key => "payee_id"
  scope :by_asset, lambda {|asset| where :asset_id => asset.id}
  scope :by_person, lambda {|person| where "payer_id=:person_id OR payee_id=:person_id", :person_id => person.id}

  validate :find_payee
  validates_presence_of :payer, :amount, :asset

  def find_payee
    if nil == self.payee=Person.where(:email=>self.to).first
      errors.add :base, 'could not find payee'
    end
  end

  def redirect_uri_with_txn_url
    unless redirect_uri.blank?
      redirect_uri + (URI.parse(redirect_uri).query.nil? ? '?' : '&') + 'txn_url=' + CGI.escape(txn_url)
    else
      ""
    end
  end

  def txn_url
    "#{asset.url}/#{id}"
  end

  def results
    if new_record?
    {
      :status => 'decline',
      :description => errors.full_messages.join(" ")
    }
    else
    {
      :to => payee.email,
      :from => payer.email,
      :amount => amount.to_s,
      :timestamp => created_at.iso8601,
      :note => note,
      :for => self.for, 
      :txn_url => txn_url,
      :asset_url => asset.url,
      :status => 'ok'
    }
    end
  end

  def as_json(options={})
    results.as_json
  end
end
