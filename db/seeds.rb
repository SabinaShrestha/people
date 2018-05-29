# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'
# include 'faker'

50.times do
  @gen = ['Male', 'Female']
  Person.create(
    name: Faker::Name.unique.name,
    age: Faker::Number.between(18,50),
    hair_color: Faker::Color.color_name,
    eye_color: Faker::Color.color_name,
    gender: @gen.sample,
    alive: Faker::Boolean.boolean
  )
end


50.times do
  Child.create(
    name: Faker::Name.unique.name,
    age: Faker::Number.between(1,16),
    gender: @gen.sample,
    person_id: Faker::Number.between(1,50)
  )
end
