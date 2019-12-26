#create users 
alice = User.create({email: 'alice@alice.com', password: 'passwordalice', password_confirmation: 'passwordalice'})
bella = User.create({email: 'bella@bella.com', password: 'passwordbella', password_confirmation: 'passwordbella'})
courtney = User.create({email: 'courtney@courtney.com', password: 'passwordcourtney', password_confirmation: 'passwordcourtney'})
delilah = User.create({email: 'delilah@delilah.com', password: 'passworddelilah', password_confirmation: 'passworddelilah'})
kaitlin = User.create({email: 'kaitlin@behervillage.com', password: 'passwordkaitlin', password_confirmation: 'passwordkaitlin', admin: true})

#affiliates 
doula = Affiliate.create({email: 'doula@doula.com', password: 'passworddoula', password_confirmation: 'passworddoula', business_name: 'ABC Doula'})
cook = Affiliate.create({email: 'cook@cook.com', password: 'passwordcook', password_confirmation: 'passwordcook', business_name: 'Meals R Us'})
lactation = Affiliate.create({email: 'lactation@lactation.com', password: 'passwordlactation', password_confirmation: 'passwordlactation', business_name: 'Lactation Consulting By Laura'})

#create service categories 
doulas = ServiceCategory.create({name: "Doulas", description: "Doula services. Lorem ipsum..."})
meal_providers = ServiceCategory.create({name: "Meal Providers", description: "Meal services. Lorem ipsum..."})
lactation_specialists = ServiceCategory.create({name: "Lactation Specialists", description: "Lactation services. Lorem ipsum..."})

#create services 
doula_service = Service.create({name: 'Apple Doula Service', description: 'Doula service description. Lorem ipsum blah blah blah this is how we do it.', price: 1543.00, intervals:20, service_category_id: doulas.id, affiliate_id: doula.id})
meal_service = Service.create({name: 'Apple Meal Service', description: 'Meal service description. Lorem ipsum blah blah blah this is how we do it.', price: 950.00, intervals:10, service_category_id: meal_providers.id, affiliate_id: cook.id})
lactation_service = Service.create({name: 'Apple Lactation Service', description: 'Lactation service description. Lorem ipsum blah blah blah this is how we do it.', price: 2104.00, intervals:20, service_category_id: lactation_specialists.id, affiliate_id: lactation.id})

#create registry
alices_registry = Registry.create({name: "Alice's Registry", slug:"alices_registry", user_id: alice, accepts_wepay: true})
bellas_registry = Registry.create({name: "Bella's Registry", slug:"bellas_registry", user_id: bella, accepts_wepay: false})
courtneys_registry = Registry.create({name: "Courtney's Registry", slug:"courtneys_registry", user_id: courtney, accepts_wepay: true})
delilahs_registry = Registry.create({name: "Delilah's Registry", slug:"delilahs_registry", user_id: delilah, accepts_wepay: false})

#create affiliate plans 
local = AffiliatePlan.create({nickname: 'local', radius_miles: 10, stripe_code: 'plan_GLlIWot9vdIto8'})
regional = AffiliatePlan.create({nickname: 'regional', radius_miles: 50, stripe_code: 'plan_GLlLVOFWdoZqcw'})
national = AffiliatePlan.create({nickname: 'national', stripe_code: 'plan_GLlKEV2eYgYJqH'})