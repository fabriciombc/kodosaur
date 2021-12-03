# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating database..."
User.destroy_all

puts "Creating users..."
# users.create = ([{ nickname: 'sissi_2012', email: 'teste@email.com', password: '123123' },
#   { nickname: 'morgan_2012', email: 'teste@email.com', password: '123123' },
#   { nickname: 'sebi_2014', email: 'teste@email.com', password: '123123' },
#   { nickname: 'manuzinha_2014', email: 'teste', password: '123123' }])

puts "Creating challenges..."
Challenge.create(objective: "Reach the goal", level: {
  map:[
    [0, 1, 0, 0, 1],
    [0, 0, 0, 0, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 0, 1, 0],
    [0, 1, 0, 1, 0]
  ],
  player: {
    x:0,
    y:0
  },
  goal:{
    x:4,
    y:4
  },
  theme:'default'
}
)
puts "seed done"
