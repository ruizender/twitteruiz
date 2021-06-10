class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  #validates :nickname, :profile_photo, presence: true
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  def to_s
    nickname
  end
  def to_s
    profile_photo
  end
end
