class User < ApplicationRecord
  has_many :rentals
  has_many :uploads
  has_many :orders
  belongs_to :subscription_type, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader

  after_create_commit :set_default_plan

  private

  def set_default_plan
    self.subscription_type = SubscriptionType.find_by(level: "Free")
    self.save
  end
end
