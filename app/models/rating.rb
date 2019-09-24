class Rating < ApplicationRecord
  belongs_to :player
  belongs_to :achievement
  belongs_to :match

  # https://stackoverflow.com/questions/4123610/how-to-implement-a-unique-index-on-two-columns-in-rails
  # https://stackoverflow.com/questions/4870961/validate-uniqueness-of-multiple-columns
  validates :player_id, uniqueness: { scope: %i[achievement_id match_id] }
end
