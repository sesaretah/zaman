class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates_format_of :mobile, :with => /[0][9][1][0-9]{8,8}/i, :on => :create
  validates :username, uniqueness: true

  has_one :agency
  has_one :profile
  has_many :advertisers, :through => :subscriptions
  has_many :subscriptions, dependent: :destroy

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
