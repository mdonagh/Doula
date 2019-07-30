# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create users 
alice = User.create([{email: 'alice@alice.com', password: 'passwordalice', password_confirmation: 'passwordalice'}])
bella = User.create([{email: 'bella@bella.com', password: 'passwordbella', password_confirmation: 'passwordbella'}])
courtney = User.create([{email: 'courtney@courtney.com', password: 'passwordcourtney', password_confirmation: 'passwordcourtney'}])
delilah = User.create([{email: 'delilah@delilah.com', password: 'passworddelilah', password_confirmation: 'passworddelilah'}])

#affiliates 
doula = Affiliate.create([{email: 'doula@doula.com', password: 'passworddoula', password_confirmation: 'passworddoula'}])
cook = Affiliate.create([{email: 'cook@cook.com', password: 'passwordcook', password_confirmation: 'passwordcook'}])
lactation = Affiliate.create([{email: 'lactation@lactation.com', password: 'passwordlactation', password_confirmation: 'passwordlactation'}])

