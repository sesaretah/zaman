class Advertiser < ActiveRecord::Base
  self.primary_key = 'uuid'

  belongs_to :user

  has_many :speardings, :as => :speardable, :dependent => :destroy
  has_many :events, :through => :speardings

  has_many :uploads, :as => :uploadable, :dependent => :destroy

  def cover(style)
    @upload = Upload.where(uploadable_id: self.id, attachment_type: 'advertiser_cover').first
    if !@upload.blank?
      return @upload.attachment(style)
    else
      ActionController::Base.helpers.asset_path("#{rand(2..6)}.png", :digest => false)
    end
  end

  def subscribed(user)
    @subscription = Subscription.where(advertiser_id: self.id, user_id: user.id).first
    if @subscription.blank?
      return false
    else
      return true
    end
  end

  def subscription_endpoint(user)
    @subscription = Subscription.where(advertiser_id: self.id, user_id: user.id).first
    if !@subscription.blank? && @subscription.status.end_point
      return true
    else
      return false
    end
  end

  before_create :set_uuid
  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  before_create :set_integer_id
  def set_integer_id
    @last = Advertiser.all.order('integer_id desc').first
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
    Advertiser.find_by_uuid(uuid)
  end
end
