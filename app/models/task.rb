class Task < ActiveRecord::Base
  self.primary_key = 'uuid'

  belongs_to :milestone
  has_many :assignments
  belongs_to :status
  has_many :discussions

  has_many :speardings, :as => :speardable, :dependent => :destroy
  has_many :events, :through => :speardings

  before_create :set_uuid
  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  def id
    self.uuid
  end

  def self.find(uuid)
    Task.find_by_uuid(uuid)
  end
end
