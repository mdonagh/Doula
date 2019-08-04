# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create users 
alice = User.create({email: 'alice@alice.com', password: 'passwordalice', password_confirmation: 'passwordalice'})
bella = User.create({email: 'bella@bella.com', password: 'passwordbella', password_confirmation: 'passwordbella'})
courtney = User.create({email: 'courtney@courtney.com', password: 'passwordcourtney', password_confirmation: 'passwordcourtney'})
delilah = User.create({email: 'delilah@delilah.com', password: 'passworddelilah', password_confirmation: 'passworddelilah'})

#affiliates 
doula = Affiliate.create({email: 'doula@doula.com', password: 'passworddoula', password_confirmation: 'passworddoula'})
cook = Affiliate.create({email: 'cook@cook.com', password: 'passwordcook', password_confirmation: 'passwordcook'})
lactation = Affiliate.create({email: 'lactation@lactation.com', password: 'passwordlactation', password_confirmation: 'passwordlactation'})

#create service categories 
doulas = ServiceCategory.create({name: "Doulas", description: "Doula services. Lorem ipsum..."})
meal_providers = ServiceCategory.create({name: "Meal Providers", description: "Meal services. Lorem ipsum..."})
lactation_specialists = ServiceCategory.create({name: "Lactation Specialists", description: "Lactation services. Lorem ipsum..."})

#create services 
doula_service = Service.create({name: 'Apple Doula Service', description: 'Doula service description. Lorem ipsum blah blah blah this is how we do it.', price: 1543.00, intervals:20, service_category_id: doulas.id, affiliate_id: doula.id})
meal_service = Service.create({name: 'Apple Meal Service', description: 'Meal service description. Lorem ipsum blah blah blah this is how we do it.', price: 950.00, intervals:10, service_category_id: meal_providers.id, affiliate_id: cook.id})
lactation_service = Service.create({name: 'Apple Lactation Service', description: 'Lactation service description. Lorem ipsum blah blah blah this is how we do it.', price: 2104.00, intervals:20, service_category_id: lactation_specialists.id, affiliate_id: lactation.id})

