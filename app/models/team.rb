class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_many :home_matches, class_name: 'Match', foreign_key: :home_team_id, dependent: :destroy
  has_many :guest_matches, class_name: 'Match', foreign_key: :guest_team_id, dependent: :destroy

  def all_matches
    Match.joins(:home_team, :guest_team)
         .where('matches.home_team_id = ? OR matches.guest_team_id = ?', id, id).order(:id)
  end
end
