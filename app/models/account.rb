class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following
  has_many :friends
  has_many :workouts
  has_many :foods
  has_one_attached :avatar

  def follow(account_id)
    following_relationships.create(following_id: account_id)
  end

  def unfollow(account_id)
    following_relationships.find_by(following_id: account_id).destroy
  end

  def is_following?(account_id)
    relationship = Follow.find_by(follower_id: id, following_id: account_id)
    return true if relationship
  end
end
