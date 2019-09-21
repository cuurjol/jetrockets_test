class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_many :matches, dependent: :destroy
end
