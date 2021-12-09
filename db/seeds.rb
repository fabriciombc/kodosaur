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

User.create!(nickname: 'morgan_2012', email: 'morgan@test.com', password: '123123')
User.create!(nickname: 'sebi_2014', email: 'sebi@test.com', password: '123123')
User.create!(nickname: 'manuzinha_2014', email: 'manu@test.com', password: '123123')
User.create!(nickname: 'duda_2014', email: 'duda@test.com', password: '123123')

puts "Creating challenges..."
# -----------------------------------------
# Level 1
# Obj: Ajude Kodo a sair de casa
Challenge.create(objective: "https://res.cloudinary.com/dgn6bjsak/image/upload/v1639055568/Kodosaur%20Stories/house_yiv28h.png", level: {
  map:[
    [0, 1, 1],
    [0, 0, 0],
    [1, 1, 0]

  ],
  player: {
    x:0,
    y:0
  },
  goal:{
    x:2,
    y:2
  },
  theme:'level1'
}
)
# -----------------------------------------
# Level 2
# Obj : Ajude Kodo a chegar no mercado.
Challenge.create(objective: "https://res.cloudinary.com/dgn6bjsak/image/upload/v1639056871/Kodosaur%20Stories/kitchen_wybzlv.png", level: {
  map:[
    [0, 0, 0],
    [0, 1, 0],
    [0, 1, 0],

  ],
  player: {
    x:0,
    y:2
  },
  goal:{
    x:2,
    y:2
  },
  theme:'level2'
}
)
# -----------------------------------------
# Level 3
# Obj : Ajude Kodo a pegar o Leite
Challenge.create(objective: "https://res.cloudinary.com/dgn6bjsak/image/upload/v1639056871/Kodosaur%20Stories/house-forest_qzlgsv.png", level: {
  map:[
    [0, 1, 1, 1],
    [0, 0, 0, 0],
    [1, 0, 1, 0]

  ],
  player: {
    x:0,
    y:0
  },
  goal:{
    x:3,
    y:2
  },
  theme:'level3'
}
)
# -----------------------------------------
#Level 4
# Obj : Ajude Kodo a pegar os ovos
Challenge.create(objective: "https://res.cloudinary.com/dgn6bjsak/image/upload/v1639056871/Kodosaur%20Stories/supermarket_rdlsi4.png", level: {
  map:[
    [0, 1, 0],
    [0, 0, 0],
    [0, 1, 0],
    [0, 1, 0]

  ],
  player: {
    x:0,
    y:3
  },
  goal:{
    x:2,
    y:3
  },
  theme:'level4'
}
)
# -----------------------------------------
#Level 5
# Obj : Ajude Kodo a pegar a farinha
Challenge.create(objective: "https://res.cloudinary.com/dgn6bjsak/image/upload/v1639056876/Kodosaur%20Stories/supermarket3_ecuerx.png", level: {
  map:[
    [0, 0, 0, 1],
    [0, 1, 1, 1],
    [0, 0, 1, 1],
    [1, 0, 0, 0]

  ],
  player: {
    x:0,
    y:0
  },
  goal:{
    x:3,
    y:3
  },
  theme:'level5'
}
)
# -----------------------------------------
#Level 6
# Obj : Ajude Kodo a pegar o chocolate
Challenge.create(objective: "Help Kodo get the chocolate", level: {
  map:[
    [0, 1, 1, 0, 0, 0, 0, 1, 1, 1],
    [0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
    [1, 0, 1, 1, 1, 0, 1, 0, 0, 1],
    [1, 0, 0, 0, 1, 0, 1, 0, 0, 0],
    [1, 1, 1, 0, 0, 0, 1, 0, 0, 0],
    [0, 1, 0, 1, 0, 0, 1, 0, 0, 0],
    [0, 1, 0, 0, 1, 0, 0, 0, 0, 1],
    [0, 1, 0, 1, 0, 1, 1, 1, 0, 1],
    [0, 1, 0, 1, 0, 0, 1, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 0]
  ],
  player: {
    x:0,
    y:0
  },
  goal:{
    x:9,
    y:9
  },
  theme:'default'
}
)

puts "seed done"
