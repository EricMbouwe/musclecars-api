# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  { name: "Eric", email: "er@server.io", password: "azerty" },
  { name: "Jo", email: "jo@server.io", password: "azerty" }
])

eric = User.first
eric.update(role: 'admin', password: 'azerty')

Car.create([
  { name: 'Renault Arkana', price: 500, description: "The brand's first Coupe SUV arrives in France" },
  { name: 'Pininfarina Residenza', price: 700, description: 'A high-end wallbox for the Battista' }
  { name: 'Maserati MC20', price: 480, description: 'The MC20 is a mid-engined supercar from Italian automaker Maserati produced from 2020.' }
])

Picture.create([
  { url: 'https://www.turbo.fr/sites/default/files/2020-09/photo_2_177e7-1200-800.jpg', imageable_id: 1, imageable_type: 'Car' },
  { url: 'https://sf1.auto-moto.com/wp-content/uploads/sites/9/2019/01/renault-clio-1-2-1024x560.jpg', imageable_id: 1, imageable_type: 'Car' },
  { url: 'https://www.challenges.fr/assets/img/2019/06/06/cover-r4x3w1000-5e4ff7b54e10f-21227339-2019-nouveau-renault-koleos-jpg.jpg', imageable_id: 1, imageable_type: 'Car' },
  { url: 'https://www.auto-moto.com/wp-content/uploads/sites/9/2021/01/renault-megane-ze-2-750x410.jpg', imageable_id: 1, imageable_type: 'Car' },
  { url: 'https://cdn.motor1.com/images/mgl/9AG0b/s1/pininfarina-battista.jpg', imageable_id: 2, imageable_type: 'Car' },
  { url: 'https://i.gaw.to/content/photos/36/94/369432_La_Pininfarina_Battista_electrique_se_devoile_comme_la_voiture_la_plus_puissante_de_l_histoire.jpg', imageable_id: 2, imageable_type: 'Car' },
  { url: 'https://passion-alfa.club/wp-content/uploads/2019/04/pininfarina_battista_geneva19_vladsavov.0.jpg', imageable_id: 2, imageable_type: 'Car' },
  { url: 'https://www.automobile-propre.com/wp-content/uploads/2020/10/Pininfarina-Battista-Wallbox-Residenza-02.jpg', imageable_id: 2, imageable_type: 'Car' },
  { url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Maserati_MC20_003.jpg/1200px-Maserati_MC20_003.jpg', imageable_id: 3, imageable_type: 'Car' },
  { url: 'https://www.motorlegend.com/modules/breve/photos/high/les-maserati-ghibli-et-quattroporte-trofeo-en-approche-21487-1-P.jpg', imageable_id: 3, imageable_type: 'Car' },
  { url: 'https://s3-eu-west-1.amazonaws.com/digischool-public/marketing-%C3%A9tudiant/Voiture_maserati_circuit.jpg', imageable_id: 3, imageable_type: 'Car' },
  { url: 'https://www.autoscout24.be/assets/auto/images/model/maserati/maserati-quattroporte/maserati-quattroporte-l-01.jpg', imageable_id: 3, imageable_type: 'Car' },
])