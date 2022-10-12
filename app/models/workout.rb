class Workout < ApplicationRecord
  belongs_to :account
  has_many :exercises, dependent: :destroy
end
