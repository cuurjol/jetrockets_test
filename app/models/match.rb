class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :guest_team, class_name: 'Team', foreign_key: 'guest_team_id'

  # https://stackoverflow.com/questions/19328713/rails-association-model-unique-multiple-foreign-key-constraint
  # https://stackoverflow.com/questions/12746280/define-a-unique-primary-key-based-on-2-columns
  # https://stackoverflow.com/questions/32681764/unique-foreign-key-in-rails-migration
  # https://stackoverflow.com/questions/3276110/rails-3-validation-on-uniqueness-on-multiple-attributes
  validates :home_team_id, uniqueness: { scope: :guest_team_id }
end
