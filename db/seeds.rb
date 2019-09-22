5.times do
  team = Team.create(name: Faker::Team.name, description: Faker::Lorem.paragraph_by_chars(512))
  12.times { Player.create(name: Faker::Name.name, age: rand(20..45), gender: Faker::Gender.binary_type, team: team) }
end

5.times do |i|
  home_team = Team.all[i]
  Team.where.not(id: home_team.id).each do |guest_team|
    Match.create(name: Faker::Company.name, city: Faker::Address.city, home_team: home_team, guest_team: guest_team)
  end
end

10.times { Achievement.create(name: Faker::Superhero.power, score: rand(10..50)) }

500.times { Rating.create(player: Player.all.sample, achievement: Achievement.all.sample, match: Match.all.sample) }
