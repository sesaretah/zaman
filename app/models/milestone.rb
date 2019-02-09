class Milestone < ActiveRecord::Base
  self.primary_key = 'uuid'

  belongs_to :project
  has_many :tasks

  before_create :set_uuid
  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  def id
    self.uuid
  end

  def self.find(uuid)
    Milestone.find_by_uuid(uuid)
  end
end
