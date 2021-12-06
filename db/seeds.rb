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
Challenge.create(objective: "Help Kodo leave the house", level: {
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
# -----------------------------------------
# Level 2
# Obj : Ajude Kodo a chegar no mercado.
Challenge.create(objective: "Help Kodo arrive at supermarket", level: {
  map:[
    [0, 1, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0],
    [0, 0, 0, 1, 0]
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
# -----------------------------------------
# Level 3
# Obj : Ajude Kodo a pegar o Leite
Challenge.create(objective: "Help Kodo get the milk", level: {
  map:[
    [0, 1, 0, 0, 0],
    [0, 1, 0, 0, 0],
    [0, 0, 0, 1, 0],
    [0, 0, 0, 1, 0],
    [0, 0, 0, 1, 0]
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
# -----------------------------------------
#Level 4
# Obj : Ajude Kodo a pegar os ovos
Challenge.create(objective: "Help Kodo get the egg", level: {
  map:[
    [0, 1, 0, 1, 0],
    [0, 0, 0, 1, 0],
    [0, 1, 0, 1, 0],
    [0, 1, 0, 0, 0],
    [0, 1, 0, 0, 0]
  ],
  player: {
    x:0,
    y:4
  },
  goal:{
    x:4,
    y:0
  },
  theme:'default'
}
)
# -----------------------------------------
#Level 5
# Obj : Ajude Kodo a pegar a farinha
Challenge.create(objective: "Help Kodo get the flour", level: {
  map:[
    [0, 0, 0, 0, 0],
    [1, 1, 1, 1, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 1, 1, 1],
    [0, 0, 0, 0, 0]
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
# -----------------------------------------
#Level 6
# Obj : Ajude Kodo a pegar o chocolate
Challenge.create(objective: "Help Kodo get the chocolate", level: {
  map:[
    [0, 1, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 0, 0, 1, 0],
    [0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0]
  ],
  player: {
    x:0,
    y:4
  },
  goal:{
    x:4,
    y:4
  },
  theme:'default'
}
)
# -----------------------------------------
#Level 7
# Obj : Ajude Kodo a pegar o fermento
Challenge.create(objective: "Help Kodo get the yeast", level: {
  map:[
    [0, 0, 0, 1, 0],
    [1, 1, 0, 1, 0],
    [0, 0, 0, 1, 0],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 0, 0]
  ],
  player: {
    x:0,
    y:0
  },
  goal:{
    x:4,
    y:0
  },
  theme:'default'
}
)
# -----------------------------------------
#Level 8
# Obj : Ajude Kodo a voltar para casa
Challenge.create(objective: "Help Kodo go back home", level: {
  map:[
    [0, 0, 0, 0, 0],
    [1, 0, 1, 1, 1],
    [0, 0, 0, 0, 0],
    [1, 1, 1, 0, 1],
    [0, 0, 0, 0, 0]
  ],
  player: {
    x:4,
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
