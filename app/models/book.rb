class Book < ApplicationRecord
  belongs_to :user

  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_many :requests, dependent: :destroy
  has_many :users, through: :requests

  validates :title, presence: true, uniqueness: true
  accepts_nested_attributes_for :genres, reject_if: :all_blank, allow_destroy: true

  def requested_by?(user)
    requests.exists?(user_id: user.id)
  end
end
