user1 = RegisteredUser.create(name: "Andres", last_name: "Vial", username: "andresvial",age: 21, email_address: "avial5@miuandes.cl", google_account: "", password:"asdf", location: "Santiago")
user2 = RegisteredUser.create(name: "Matias", last_name: "Ponce", username: "matijojo",age: 21, email_address: "maponce@miuandes.cl", google_account: "", password:"adfg", location: "Santiago")
user3 = RegisteredUser.create(name: "Jojo", last_name: "Smith", username: "jotarito",age: 22, email_address: "maponce@miuandes.cl", google_account: "", password:"sdfg", location: "Santiago")
user4 = RegisteredUser.create(name: "Julio", last_name: "Castro", username: "jululu",age: 28, email_address: "juliojaja@miuandes.cl", google_account: "", password:"toda", location: "Valparaiso")

event1 = Event.new(title: "JulioCon", description: "Convencion de julios", banner:"banner.png", location: "Melipilla", final_date: "09/14/2009 8:00, %m/%d/%Y %H:%M",date_rule: "admin choose")
event2 = Event.new(title: "JojoCon", description: "Convencion de Jojo", banner:"banner.png", location: "Santiago", final_date: "09/14/2019 10:00, %m/%d/%Y %H:%M",date_rule: "guests choose")

event1.registered_user = user2
event2.registered_user = user1

event1.save!
event2.save!

profileuser1 = UserProfile.new(profile_picture: "p1.png", banner_picture: "p1b.png")
profileuser1.registered_user = user1
profileuser1.save!

profileuser2 = UserProfile.new(profile_picture: "p2.png", banner_picture: "p2b.png")
profileuser2.registered_user = user2
profileuser2.save!

profileuser3 = UserProfile.new(profile_picture: "p3.png", banner_picture: "p3b.png")
profileuser3.registered_user = user3
profileuser3.save!

profileuser4 = UserProfile.new(profile_picture: "p4.png", banner_picture: "p4b.png")
profileuser4.registered_user = user4
profileuser4.save!

