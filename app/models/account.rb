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
  has_many :comments
  has_one_attached :avatar

  validates :username, presence: true, length: { minimum: 4, maximum: 10 }, uniqueness: { case_sensitive: false }
  validate :username_format
  validates :email, presence: true, uniqueness: { case_sensitive: false }

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

  def username_format
    has_one_letter = username =~ /[a-zA-Z]/
    all_valid_characters = username =~ /^[a-zA-Z0-9_]+$/
    unless has_one_letter and all_valid_characters
      errors.add(:username,
                 "must have at least one letter and contain only letters, digits, or underscores")
    end
  end
end
