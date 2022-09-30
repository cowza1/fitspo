class Post < ApplicationRecord
  belongs_to :account
  has_one_attached :photo
  has_many :comments

  scope :active, -> { where active: true }
end
