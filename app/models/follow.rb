class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'Account'
  belongs_to :following, foreign_key: 'following_id', class_name: 'Account'
end
