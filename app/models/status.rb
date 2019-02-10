class Status < ActiveRecord::Base
  self.primary_key = 'uuid'

  has_many :subscriptions
  before_create :set_uuid

  validate :only_one_start

  def only_one_start
    @status = Status.where(start_point: true, scope_type: self.scope_type).first
    if !self.start_point || (self.start_point && @statuses.blank?) || @status.id == self.id
      return true
    else
      errors.add(:start_point, I18n.t(:is_already_exist))
    end
  end

  def nexts
    @nexts = Status.where(previous_id: self.id, scope_type: self.scope_type)
    if !@nexts.blank?
      return @nexts
    end
  end

  def set_uuid
    self.uuid = SecureRandom.uuid
  end


  def id
    self.uuid
  end

  def self.find(uuid)
    Status.find_by_uuid(uuid)
  end
end
