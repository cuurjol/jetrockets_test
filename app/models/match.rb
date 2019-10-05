class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :guest_team, class_name: 'Team', foreign_key: 'guest_team_id'

  scope :last_five_matches_by_team, ->(team) { where(home_team: team).or(where(guest_team: team)) }

  # https://stackoverflow.com/questions/4123610/how-to-implement-a-unique-index-on-two-columns-in-rails
  # https://stackoverflow.com/questions/4870961/validate-uniqueness-of-multiple-columns
  validates :home_team_id, uniqueness: { scope: :guest_team_id }
end
