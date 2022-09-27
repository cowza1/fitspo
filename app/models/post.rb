class Post < ApplicationRecord
  belongs_to :account
  has_one_attached :photo

  scope :active, -> { where active: true }
end
