class Event < ActiveRecord::Base
  self.primary_key = 'uuid'
  has_many :overlaps, dependent: :destroy

  has_many :speardings, :as => :speardable, :dependent => :destroy
  has_many :advertisers, :through => :speardings

  before_create :set_uuid
  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  before_create :set_integer_id
  def set_integer_id
    @last = Event.all.order('integer_id desc').first
    if !@last.blank?
      @last_id = @last.integer_id
    else
      @last_id = 0
    end
    self.integer_id = @last_id + 1
  end

  def id
    self.uuid
  end

  def self.find(uuid)
    Event.find_by_uuid(uuid)
  end
end
