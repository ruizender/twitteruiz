class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  #validates :email, :nickname, :profile_photo, presence: true
  has_many :tweets
  has_many :likes
  def to_s
    nickname
  end
end
