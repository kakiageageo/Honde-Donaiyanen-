class User < ApplicationRecord
  has_many :books

  has_many :favorites, dependent: :destroy
  has_many :genres, through: :favorites

  has_many :dislikes, dependent: :destroy
  has_many :genres, through: :dislikes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest"
    end
  end

  def guest?
    email == GUEST_USER_EMAIL
  end

end
