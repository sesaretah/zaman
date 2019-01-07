class Spearding < ActiveRecord::Base
  self.primary_key = 'uuid'

  belongs_to :event
  belongs_to :speardable, :polymorphic => true
  belongs_to :advertiser, :class_name => "Adveritser", :foreign_key => "speardable_id"

  before_create :set_uuid

  def set_uuid
    self.uuid = SecureRandom.uuid
  end


  def id
    self.uuid
  end

  def self.find(uuid)
    Spearding.find_by_uuid(uuid)
  end
end
