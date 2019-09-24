class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :ratings
  has_many :achievements, through: :ratings, dependent: :destroy

  def self.top5(achievement, team = nil)
    if team.present?
      joins(:ratings, :team).where(ratings: { achievement_id: achievement.id }, teams: { id: team.id })
                            .group('ratings.player_id').order(Arel.sql('count(*) DESC')).limit(5)
    else
      joins(:ratings).where(ratings: { achievement_id: achievement.id }).group('ratings.player_id')
                     .order(Arel.sql('count(*) DESC')).limit(5)
    end
  end

  def mark_achievement(achievement, match)
    Rating.create(player: self, achievement: achievement, match: match)
  end

  def got_achievement_last_five_matches?(achievement)
    last_five_matches_ids = team.all_matches.last(5).pluck(:id)
    ratings.where(achievement_id: achievement.id, match_id: last_five_matches_ids).count >= 1
  end
end
