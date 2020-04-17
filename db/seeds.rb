require 'faker'

#destruction des tables antérieures

User.destroy_all
Event.destroy_all
Attendance.destroy_all

#arrays dans lesquels le programme va venir récupérer les Fake éléments
u_ar = []
e_ar = []


20.times do
    u=User.create(email: "#{Faker::Name.first_name}@yopmail.com", description: Faker::Lorem.paragraph_by_chars(number:15), first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "123456") 
    u_ar << u
end 
puts "User done"

10.times do
    e=Event.create(start_date: Faker::Date.between(from: 2.years.ago, to: 1.year.from_now), duration: 90, title: Faker::Hipster.sentence(word_count:3), description: Faker::Lorem.paragraph(sentence_count:7), price: Faker::Number.between(from:1, to:1000), location: Faker::Address.street_address, admin: u_ar.sample)
    e_ar << e
end
puts "Event done"

15.times do
    Attendance.create(participant: u_ar.sample, event:e_ar.sample)
end
puts "Schedule done"



