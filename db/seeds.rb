# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'fr'

User.destroy_all
Gossip.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all
City.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts 'Destoy all Tables and reset primary key'

10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

puts 'Add 10 Cities'

User.create(first_name: "John", last_name: "Snow", description: "The global warming is here...", email: "js@gof.com", age: 23, city_id: 1, password: "thptest") 
puts 'Add Test User'

10.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.password = 'thptest'
  user.description = Faker::Lorem.paragraph(sentence_count: 5)
  user.age = rand(18..50)
  user.email = Faker::Internet.free_email(name: user.first_name)
  user.city = City.all.sample
  user.save
end

puts 'Add 10 Users'

10.times do
  Tag.create(tag: "##{Faker::Lorem.word}")
end

puts 'Add 10 Tags'

20.times do
  mixed_tags = Tag.all.shuffle
  tags = [mixed_tags[0], mixed_tags[1]]
  gossip = Gossip.new(title: Faker::Lorem.paragraph(sentence_count: 1), content: Faker::Lorem.paragraph(sentence_count: 5))
  gossip.tags = tags
  gossip.user = User.all.sample
  gossip.save
end

puts 'Add 20 Gossips'

10.times do
  mixed_recipients = User.all.shuffle

  pm = PrivateMessage.new(content: Faker::Lorem.paragraph(sentence_count: 5))
  pm.sender = mixed_recipients[0]
  pm.recipient = mixed_recipients[1]
  pm.save
end

puts 'Add 10 Private Messages'
