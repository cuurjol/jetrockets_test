class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :ratings
  has_many :achievements, through: :ratings, dependent: :destroy
end
