require "faker"

brands = []
15.times do
  brands << Faker::Beer.brand
end

brands.uniq.each do |brand|
  Brand.create!(name: brand)
end

Brand.all.each do |brand|
  10.times do
    Beer.create(
      name: Faker::Beer.name,
      style: Faker::Beer.style,
      percentage: Faker::Beer.alcohol,
      brand: brand
    )
  end
end

10.times do
  User.create!(username: Faker::Internet.username)
end

User.all.each do |user|
  5.times do
    Favorite.create!(user: user, beer: Beer.order("RANDOM()").first)
  end
end
