class Profile < ActiveRecord::Base
  self.primary_key = 'uuid'
  has_many :overlaps, dependent: :destroy


  def image(style)
    @upload = Upload.where(uploadable_type: 'Profile', uploadable_id: self.id, attachment_type: 'profile_avatar').first
    if !@upload.blank?
      return @upload.attachment(style)
    else
      ActionController::Base.helpers.asset_path("noimage-35-#{style}.jpg", :digest => false)
    end
  end

  before_create :set_uuid
  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  before_create :set_integer_id
  def set_integer_id
    @last = Profile.all.order('integer_id desc').first
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
    Profile.find_by_uuid(uuid)
  end
end
