require 'faker'
require 'open-uri'

puts 'Cleaning database...'
Chatroom.destroy_all
Favorite.destroy_all
Search.destroy_all
Experience.destroy_all
User.destroy_all

# base de données expériences et search

LINES_OF_WORK = [
  "Ventes",
  "Production",
  "Marketing"
]

FIELDS = [
  "Services-aux-entreprises",
  "Textile, Habillement & Chaussure",
  "Transports & Logistique"
]

FRENCH_CITIES = [
  "Paris", "Lyon", "Marseille"
]

puts 'Creating users and experiences....'
users = []
experiences = []
searches = []

# users & experiences figés

puts "creating Pascal"

users << User.create!(
  first_name: "Pascal",
  last_name: "Auribaud",
  username: "Pascal82",
  email: "pascal@hotmail.fr",
  password: "password",
  date_of_birth: Date.new(1982, 8, 25),
  description: "Expert en marketing digital dans le secteur de la mode, je pilote les stratégies e-commerce et social media chez Zara. Je suis passionné par l'innovation et les nouvelles tendances du retail."
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1733134021/istockphoto-498256634-612x612_wnckma.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2016, 6, 15),
  end_date: Date.new(2020, 8, 20),
  is_current: false,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Lyon, France",
  latitude: 45.764043,
  longitude: 4.835659,
  firm: "Camaieu",
  postname: "Chef de Produit Marketing"
)
experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2020, 9, 1),
  end_date: Date.new(2022, 8, 31),
  is_current: false,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 48.856613,
  longitude: 2.352222,
  firm: "Nike",
  postname: "Responsable E-commerce"
)
experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2022, 9, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 48.856613,
  longitude: 2.352222,
  firm: "Zara",
  postname: "Responsable Marketing Digital"
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Virginie"
users << User.create!(
  first_name: "Virginie",
  last_name: "Bonnet",
  username: "Virginie73",
  email: "Virginie@holiday.fr",
  password: "password",
  date_of_birth: Date.new(1973, 12, 7),
  description: "Actuellement Chef de produit marketing chez WoolOvers avec 15 ans d'expérience dans le textile. Je suis spécialisée dans le développement de collections et l'analyse des tendances mode."
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732812152/rsbcsegxvjbqumd5vuvt.png").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save


experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2009, 5, 1),
  end_date: Date.new(2019, 3, 14),
  is_current: false,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Lyon, France",
  latitude: 45.764043,
  longitude: 4.835659,
  firm: "H&M",
  postname: "Chargée de collections tendance"
)

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2019, 4, 20),
  end_date: Date.new(2022, 1, 1),
  is_current: false,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 48.856613,
  longitude: 2.352222,
  firm: "WoolOvers",
  postname: "Chargée de Marketing"
)
experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2022, 3, 15),
  end_date: nil,
  is_current: true,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 48.856613,
  longitude: 2.352222,
  firm: "WoolOvers",
  postname: "Chef de Produit Marketing"
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Sophie"

users << User.create!(
  first_name: "Sophie",
  last_name: "Ianila",
  username: "Sophie98",
  email: "sophie@yahoo.fr",
  password: "password",
  date_of_birth: Date.new(1984, 8, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732812026/okuu9ml6soz8xm1tsgqk.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2021, 6, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Ventes",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 44.837789,
  longitude: -0.57918,
  firm: "Uniqlo",
  postname: "Responsable Commercial"
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Justin"

users << User.create!(
  first_name: "Justin",
  last_name: "Bridou",
  username: "Surfing_Justin",
  email: "justin@bridao.fr",
  password: "password",
  date_of_birth: Date.new(1994, 8, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732811206/samples/smile.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2015, 6, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Ventes",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 44.837789,
  longitude: -0.57918,
  firm: "Uniqlo",
  postname: "Responsable Commercial"
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Stéphane"

users << User.create!(
  first_name: "Stéphane",
  last_name: "Jacquot",
  username: "StephaneJ",
  email: "Stephane@wanadoo.fr",
  password: "password",
  date_of_birth: Date.new(1970, 8, 25),
  description: "Responsable Acquisition chez Jonak depuis 7 ans, expert en stratégies marketing et développement de la marque dans l'industrie du textile. J'adore l'analyse de données digitales."
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1733134021/St%C3%A9phane_qxhsn4.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save


experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2011, 1, 1),
  end_date: Date.new(2015, 12, 31),
  is_current: false,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Lyon, France",
  latitude: 45.764043,
  longitude: 4.835659,
  firm: "Patagonia",
  postname: "Chargée Acquisition"
)

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2017, 10, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 48.856613,
  longitude: 2.352222,
  firm: "Jonak",
  postname: "Responsable Acquisition"
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Pauline"

users << User.create!(
  first_name: "Pauline",
  last_name: "Forcet",
  username: "Paulinette",
  email: "pauline@gmail.com",
  password: "password",
  date_of_birth: Date.new(1985, 12, 7),
  description: "Directrice Marketing chez Veja, experte en développement produit et marketing textile. Passionnée par la mode éthique et les nouvelles tendances du secteur."
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1733134021/1000_F_105632490_xr18ylLjgVkBhgwu7MefPDN7PjmyAqSy_dhubdi.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2016, 3, 15),
  end_date: Date.new(2018, 12, 31),
  is_current: false,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 45.764043,
  longitude: 4.835659,
  firm: "Nike",
  postname: "Analyste Marketing"
)

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2019, 2, 1),
  end_date: Date.new(2021, 12, 31),
  is_current: false,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Lyon, France",
  latitude: 45.764043,
  longitude: 4.835659,
  firm: "Zara",
  postname: "Responsable Marketing"
)

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2022, 1, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 48.856613,
  longitude: 2.352222,
  firm: "Veja",
  postname: "Directrice Marketing"
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Maiza"

users << User.create!(
  first_name: "Maizena",
  last_name: "Tiroud",
  username: "TiMaiza",
  email: "maiza@hourra.fr",
  password: "password",
  date_of_birth: Date.new(1987, 8, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1733134196/istockphoto-914875306-612x612_mz6b5g.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2022, 6, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Ventes",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 44.837789,
  longitude: -0.57918,
  firm: "Uniqlo",
  postname: "Responsable Commercial"
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Justine"

users << User.create!(
  first_name: "Justine",
  last_name: "Tacquillard",
  username: "justine_HUG",
  email: "justine@hodao.fr",
  password: "password",
  date_of_birth: Date.new(1984, 8, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732812166/txv5zwjqk3chyv5dozzf.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2015, 6, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Ventes",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 44.837789,
  longitude: -0.57918,
  firm: "Uniqlo",
  postname: "Commercial"
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Juliette"

users << User.create!(
  first_name: "Juliette",
  last_name: "Voilatipa",
  username: "juju",
  email: "juliette.voilatipa@yahoo.fr",
  password: "password",
  date_of_birth: "1990-09-13",
)
photojuliette = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732812190/k77ntqucqxeverih1qlr.jpg").open
User.last.photo.attach(io: photojuliette, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

Experience.create!(
    user: User.last,
    start_date: "2020-02-02",
    is_current: true,
    line_of_work: "Marketing",
    field: "Textile, Habillement & Chaussure",
    address: "Paris, France"
  )

# Search.create!(
#   user: User.last,
#   address: "Lyon, France",
#   field: "Textile, Habillement & Chaussure",
#   line_of_work: "Marketing",
#   is_offering: false,
# )

# Search.create!(
#   user: User.last,
#   address: "Paris, France",
#   field: "Textile, Habillement & Chaussure",
#   line_of_work: "Marketing",
#   is_offering: false,
# )

# # Define juliette and pascal variables
# juliette = User.find_by(username: "juju")
# pascal = User.find_by(username: "Pascal92")
# # virginie = User.find_by(username: "Virginie73")
# # sophie = User.find_by(username: "Sophie98")

# # Chatroom 1: Juliette and Pascal
# chatroom1 = Chatroom.create!(user_1: juliette, user_2: pascal)
# Message.create!([
#   { chatroom: chatroom1, sender: juliette, content: "Bonjour Pascal! J'ai vu que tu travailles dans le Marketing textile. Je cherche justement à me réorienter dans ce domaine.", created_at: 2.days.ago },
#   { chatroom: chatroom1, sender: pascal, content: "Bonjour Juliette! Effectivement, je travaille dans ce secteur depuis 3 ans. Je serai ravi d'échanger avec toi sur mon expérience.", created_at: 2.days.ago + 1.hour },
#   { chatroom: chatroom1, sender: juliette, content: "Super! J'aimerais beaucoup avoir ton retour sur la transition du marketing vers la vente.", created_at: 2.days.ago + 2.hours }
# ])

# # Chatroom 2: Juliette and Virginie
# chatroom2 = Chatroom.create!(user_1: juliette, user_2: virginie)
# Message.create!([
#   { chatroom: chatroom2, sender: virginie, content: "Salut Juliette! J'ai vu que tu cherches des contacts dans le Marketing textile à Paris?", created_at: 1.day.ago },
#   { chatroom: chatroom2, sender: juliette, content: "Oui tout à fait! Je cherche à rencontrer des professionnels du secteur.", created_at: 1.day.ago + 30.minutes },
#   { chatroom: chatroom2, sender: virginie, content: "Je peux te présenter quelques personnes de mon réseau si tu veux!", created_at: 1.day.ago + 1.hour }
# ])

# # Chatroom 3: Juliette and Sophie
# chatroom3 = Chatroom.create!(user_1: juliette, user_2: sophie)
# Message.create!([
#   { chatroom: chatroom3, sender: juliette, content: "Salut Juliette! Je vois que tu es en poste dans le textile à Paris?", created_at: 2.minutes.ago },
#   # C'est super, je suis intéressée par ton poste et ton secteur. Je serais ravie d'échanger davantage avec toi.
# ])


# puts "Created 2 chatrooms with conversations for Juliette"



puts 'Seed complete! 🎉'
