class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :ratings
  has_many :achievements, through: :ratings, dependent: :destroy

  def self.top5(achievement, team = nil)
    if team.present?
      joins(:ratings, :team).where(ratings: { achievement: achievement }, teams: { id: team })
                            .group('ratings.player_id').order(Arel.sql('count(*) DESC')).limit(5)
    else
      joins(:ratings).where(ratings: { achievement: achievement }).group('ratings.player_id')
                     .order(Arel.sql('count(*) DESC')).limit(5)
    end
  end

  def add_achievement!(achievement, match)
    ratings.create!(achievement: achievement, match: match)
  end

  def got_achievement_last_five_matches?(achievement)
    ratings.where(achievement: achievement, match: Match.last_five_matches_by_team(team)).count >= 1
  end
end
