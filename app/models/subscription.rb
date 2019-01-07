class Subscription < ActiveRecord::Base
  self.primary_key = 'uuid'

  belongs_to :status
  belongs_to :user
  belongs_to :advertiser

  before_create :set_uuid
  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  def id
    self.uuid
  end

  def self.find(uuid)
    Subscription.find_by_uuid(uuid)
  end
end
