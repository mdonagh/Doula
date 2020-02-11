case Rails.env
when "development"
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
    doula_service = Service.create({name: 'Apple Doula Service', description: 'Doula service description. Lorem ipsum blah blah blah this is how we do it.', price: 1543.00, intervals:20, service_category_id: doulas.id, affiliate_id: doula.id, img_url: 'https://placekitten.com/300/200'})
    meal_service = Service.create({name: 'Apple Meal Service', description: 'Meal service description. Lorem ipsum blah blah blah this is how we do it.', price: 950.00, intervals:10, service_category_id: meal_providers.id, affiliate_id: cook.id, img_url: 'https://placekitten.com/600/400'})
    lactation_service = Service.create({name: 'Apple Lactation Service', description: 'Lactation service description. Lorem ipsum blah blah blah this is how we do it.', price: 2104.00, intervals:20, service_category_id: lactation_specialists.id, affiliate_id: lactation.id, img_url: 'https://placekitten.com/800/300'})

    #create registry
    alices_registry = Registry.create({name: "Alice's Registry", slug:"alices_registry", user_id: alice, accepts_wepay: true, due_date: Date.new + 180.days, shower_date: Date.new + 120.days})
    bellas_registry = Registry.create({name: "Bella's Registry", slug:"bellas_registry", user_id: bella, accepts_wepay: false, due_date: Date.new + 180.days, shower_date: Date.new + 120.days})
    courtneys_registry = Registry.create({name: "Courtney's Registry", slug:"courtneys_registry", user_id: courtney, accepts_wepay: true, due_date: Date.new + 180.days, shower_date: Date.new + 120.days})
    delilahs_registry = Registry.create({name: "Delilah's Registry", slug:"delilahs_registry", user_id: delilah, accepts_wepay: false, due_date: Date.new + 180.days, shower_date: Date.new + 120.days})

    #create affiliate plans 
    local = AffiliatePlan.create({nickname: 'local', radius_miles: 10, stripe_code: 'plan_GLlIWot9vdIto8'})
    regional = AffiliatePlan.create({nickname: 'regional', radius_miles: 50, stripe_code: 'plan_GLlLVOFWdoZqcw'})
    national = AffiliatePlan.create({nickname: 'national', stripe_code: 'plan_GLlKEV2eYgYJqH'})

    #Add registry services
    RegistryService.create(registry_id: alices_registry.id, service_id: doula_service.id)
    RegistryService.create(registry_id: alices_registry.id, service_id: meal_service.id)
    RegistryService.create(registry_id: alices_registry.id, service_id: lactation_service.id)



    terms_and_conditions = TermsAndConditions.create(active: true, text: "1. ACKNOWLEDGMENT AND ACCEPTANCE OF TERMS OF SERVICE
    THIS IS A LEGAL AGREEMENT BETWEEN YOU (USER OR YOU) AND WONDERSOFT INC (Wondersoft). BY COMPLETING THE REGISTRATION PROCESS, YOU ARE INDICATING YOUR AGREEMENT TO BE BOUND BY ALL OF THE TERMS AND CONDITIONS OF THIS AGREEMENT. The Online Service (Service) is provided to you (User) under the following Wondersoft terms (Terms). The Terms comprise the entire agreement between User and Wondersoft and supersede all prior agreements between the parties regarding the subject matter contained herein.


    2. DESCRIPTION OF SERVICE
    Wondersoft is providing User with a capability to create and convert PDF files. User must: (1) provide all equipment and communications services, including a computer and modem, necessary to establish a connection to the World Wide Web and (2) provide for own access to the World Wide Web and pay any connection and service fees associated with such access. In consideration for this Service, User agrees to: (1) provide certain current, complete, and accurate information about User as prompted to do so by the Service and (2) maintain and update this information as required to keep it current, complete and accurate. All information requested on original sign up shall be referred to as registration Information (Registration Information). Wondersoft will maintain Registration Information in accordance with these Terms and then current PDF Copy Paste privacy policy, available at http://www.pdfcopypaste.com/privacy.html. Should there be any conflict between these Terms and Wondersoft's privacy policy, these Terms shall supersede the privacy policy. You authorize a recurring monthly or annual charge to your credit card in exchange for use of the Wondersoft service as indicated by published standard plans or a customized quote provided for your specific use. You also agree that the enrollment for the next service period is automatic. Please note that refunds on a pro-rated basis are issued only for yearly plans. When yearly subscriptions are cancelled before the subscriptions end, refunds are issued based on a pro-rated calculation of the subscription charges at the monthly rate for the plan, for the actual number of months the account was subscribed (the number of months between the most recent yearly charges and the cancellation date). If the calculated refund amount exceeds the yearly subscription rate, then no refund is issued.

    Wondersoft will not issue any pro-rated refunds for the remaining period during the month when an account with a monthly subscription plan (current plan) is downgraded to a smaller plan (new plan) (a plan that costs less per month than the current plan) during the middle of a month. However the rate applicable to the new plan will automatically be charged starting the first of the subsequent month, and you must contact sales@pdfcopypaste.com in order to downgrade. If you attempt to sign up for a downgraded account via the online system, it will be considers as a new account and therefore you will be charged for both accounts until you cancel your old subscription.



    3. CONDITIONS OF USE
    You are solely responsible for the content of all data You store or retrieve from, or attempt to store or retrieve from, Your Account. Your use of the Service is subject to all applicable local, state, national and international laws and regulations. You will: (a) not use the Service for any illegal purposes; (b) not use the Service to store, retrieve, transmit or view any file, data, image or program that contains: (i) any illegal pictures, materials or information; (ii) any harassing, libelous, abusive, threatening, harmful, vulgar, pornographic, obscene or otherwise objectionable material of any kind or nature; (iii) any material that encourages conduct that could constitute a criminal offense, give rise to civil liability or otherwise violate any applicable local, state, national or international law or regulation; (iv) any code or material that violates the intellectual property rights of others; (v) any Windows temporary files of any kind (including, without limitation, any *.p or ~*.* files); or (vi) any viruses, worms, Trojan horses or any other similar contaminating or destructive features; (c) comply with United States and other applicable law regarding the exportation and re-exportation of any data or other materials from the United States or other jurisdictions through the Service; (d) not use the Service for any spamming, chain letters or other use that may otherwise disrupt the Service or the networks through which You access and use the Service; (e) comply with all regulations, policies and procedures of networks through which You access and use the Service; and (f) not access or attempt to access any Service account for which You have no access authorization or duplicate, modify, distribute or display any of the data or files from any such account. (h) Wondersoft PDF creation service should not be used to sell digital content to others. It is not a media for dissemination of digital content for commercial purposes. WE WILL NOT APPROACH YOUR DATA BUT IF WE SUSPECT ILLEGAL ACTIVITY WE WILL NOTIFY YOU FOR ACCOUNT TERMINATION

    4. MODIFICATIONS TO SERVICE
    Wondersoft reserves the right to modify or discontinue the Service with or without notice to User. Wondersoft shall not be liable to User or any third party should Wondersoft exercise its right to modify or discontinue the Service.

    5. AUTOMATIC CONVERSION OF TRIAL TO PAID ACCOUNTS
    Wondersoft may offer trial accounts that require users to provide credit card information which may be used to convert the trial to a paid account at the end of free trial period. If the card transaction fails at the end of free trial period, an email would be sent to the user requesting the user to upgrade the account manually online. In such a case, if the user fails to upgrade to a paid account within three business days, account will be suspended.

    6. USER ACCOUNT, PASSWORD, AND SECURITY
    Once you become a User of the Service, you shall receive a password and an account. You are entirely responsible if you do not maintain the confidentiality of your password and account. Furthermore, you are entirely responsible for any and all activities which occur under your account. You may change your password at any time by following instructions which we provide to you through our on line support. You agree to immediately notify Wondersoft of any unauthorized use of your account or any other breach of security of which you become aware.

    7. DISCLAIMER OF WARRANTIES
    USER EXPRESSLY AGREES THAT USE OF THE SERVICE IS AT USER'S SOLE RISK. ALTHOUGH Wondersoft WILL ATTEMPT TO PROVIDE UNINTERRUPTED, TIMELY, AND SECURE SERVICES, Wondersoft MAKES NO REPRESENTATION THAT IT WILL BE ABLE TO DO SO. THE SERVICE IS PROVIDED ON AN AS IS AND AS AVAILABLE BASIS. Wondersoft EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. Wondersoft MAKES NO WARRANTY THAT THE SERVICE WILL MEET YOUR REQUIREMENTS, OR THAT THE SERVICE WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR FREE. USER UNDERSTANDS AND AGREES THAT ANY MATERIAL AND/OR DATA DOWNLOADED OR OTHERWISE OBTAINED THROUGH THE USE OF THE SERVICE IS DONE AT USER'S OWN DISCRETION AND RISK AND THAT USER WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO USER'S COMPUTER \ SYSTEM OR LOSS OF DATA OR UNAUTHORIZED DISCLOSURE OF DATA THAT RESULTS FROM THE UPLOAD, DOWNLOAD OR STORAGE OF SUCH MATERIAL AND/OR DATA. Wondersoft MAKES NO WARRANTY REGARDING ANY GOODS OR SERVICES PURCHASED OR OBTAINED THROUGH THE SERVICE OR ANY TRANSACTIONS ENTERED INTO THROUGH THE SERVICE. NO ADVICE OR INFORMATION, WHETHER ORAL OR WRITTEN, OBTAINED BY USER FROM Wondersoft OR THROUGH THE SERVICE SHALL CREATE ANY WARRANTY NOT EXPRESSLY MADE HEREIN. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF CERTAIN WARRANTIES, SO SOME OF THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.

    8. LIMITATIONS OF LIABILITY
    IN NO EVENT SHALL Wondersoft OR ITS ADVERTISERS OR SUPPLIERS HAVE ANY OBLIGATION OR LIABILITY TO YOU FOR THE COST OF PROCUREMENT OF SUBSTITUTE SERVICES OR DATA OR FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES (INCLUDING, WITHOUT LIMITATION, ANY LOSS OF DATA, REVENUE OR PROFITS OR BUSINESS INTERRUPTION) OR OTHER PECUNIARY LOSS ARISING OUT OF YOUR USE OR INABILITY TO USE YOUR ACCOUNT OR THE SERVICE OR YOUR LOSS OF DATA OR FILES STORED THEREIN.

    9. NO RESALE OR COMMERCIAL USE OF THE SERVICE
    User's right to use the Service is personal to User. User agrees not to resell or make any commercial use of the Service, without the prior express written consent of Wondersoft.

    10. SECURITY OF STORED DATA AND FILES
    Wondersoft will endeavor to restrict access to the data and files You store or retrieve from Your Account to persons accessing such data and files through use of Your Account or Password. It may also be necessary to access users accounts to verify that the accounts are not being misused, especially with respect to digital copy-right laws and resource misuse checks including bandwidth.


    11. INDEMNIFICATION
    User agrees to indemnify and hold Wondersoft, contractors, suppliers and its and their employees, harmless from and against any claim or demand, including reasonable attorneys' fees, made by any third party due to or arising out of User's use of the Service, the violation of these Terms by User, or the infringement by User, or other user of the Service using User's computer, of any intellectual property or other right of any person or entity.

    12. ACCOUNT SUSPENSION:
    Account suspension will occur if the user fails to provide a valid credit card for transactions. If the user fails to provide valid credit card information within a month of suspension, the account and the entire data stored in the quota for the user will be terminated. However, if the succeeds to provide the information the account will be completely recovered.

    13. TERMINATION
    The User may terminate the Service with or without cause at any time and effective immediately. Should User object to any terms and conditions of the Terms or any subsequent modifications thereto or become dissatisfied with the Service in any way, User's only recourse is to immediately: (1) discontinue use of the Service; (2) terminate Service Membership; and (3) notify Wondersoft of termination. Upon termination of the Service, User's right to use the Service and Software immediately ceases. User shall have no right and Wondersoft will have no obligation thereafter to continue to store User’s data or information or to forward any unread or unsent messages to User or any third party. Wondersoft will terminate accounts in two cases (1) after a month of account suspension. (2) Misuse suspicion. In either case, the user is notified of the action via an email from Wondersoft.

    14. NOTICE
    All notices to a party shall be in writing and shall be made either via email or conventional mail. Wondersoft may broadcast notices or messages through the Service to inform User of changes to the Terms, the Service, or other matters of importance; such broadcasts shall constitute notice to User.

    15. PROPRIETARY RIGHTS TO CONTENT
    User acknowledges that content, including but not limited to text, software, music, sound, photographs, video, graphics or other material contained in either sponsor advertisements or email-distributed, commercially produced information presented to User by the Service (Content) by Wondersoft or Wondersoft's Advertisers (“Advertiser”), is protected by copyrights, trademarks, service marks, patents or other proprietary rights and laws; therefore, User is only permitted to use this Content as expressly authorized by the Service or the Advertiser. User may not copy, reproduce, distribute, or create derivative works from this Content without expressly being authorized to do so by the Service or the Advertiser.")

when "production"
    User.create({email: 'kaitlin@behervillage.com', password: 'p9dj30sntb59', password_confirmation: 'p9dj30sntb59', admin: true})
    User.create({email: 'sara@tibsarsoftware.com', password: '7hfk349nfs0', password_confirmation: '7hfk349nfs0', admin: true})

    local = AffiliatePlan.create({nickname: 'local', radius_miles: 10, stripe_code: 'plan_GiGZLfSt7S1zqt'})
    regional = AffiliatePlan.create({nickname: 'regional', radius_miles: 100, stripe_code: 'plan_GiGZgnUbkj6ARI'})
    national = AffiliatePlan.create({nickname: 'national', stripe_code: 'plan_GiGZJBnaKDm230'})

    childbirth_education = ServiceCategory.create({name: "Childbirth Education"})
    yoga = ServiceCategory.create({name: "Yoga"})
    birth_doula = ServiceCategory.create({name: "Birth Doula"})
    postpartum_doula = ServiceCategory.create({name: "Postpartum Doula"})
    midwife = ServiceCategory.create({name: "Midwife"})
    meal_services = ServiceCategory.create({name: "Meal Services"})
    house_cleaner = ServiceCategory.create({name: "House Cleaner"})
    laundry = ServiceCategory.create({name: "Laundry"})
    lactation_support = ServiceCategory.create({name: "Lactation Support"})
    photography = ServiceCategory.create({name: "Photography"})
    massage = ServiceCategory.create({name: "Massage"})
    childcare = ServiceCategory.create({name: "Childcare"})
    pet_care = ServiceCategory.create({name: "Pet Care"})
    mental_health_support = ServiceCategory.create({name: "Mental Health Support"})
    coaching = ServiceCategory.create({name: "Coaching (parent, sleep, health, etc.)"})
    mommy_and_me_fitness = ServiceCategory.create({name: "Mommy + Me Fitness"})
    pelvic_floor_health = ServiceCategory.create({name: "Pelvic Floor Health"})
    chiropractic_care = ServiceCategory.create({name: "Chiropractic Care"})
    acupuncture = ServiceCategory.create({name: "Acupuncture"})
    placenta_services = ServiceCategory.create({name: "Placenta Services"})
    support_groups = ServiceCategory.create({name: "Support Groups"})
    play_space = ServiceCategory.create({name: "Play Space"})
    wellness_center = ServiceCategory.create({name: "Wellness Center"})
    other = ServiceCategory.create({name: "Other"})


end


