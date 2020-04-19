user1 = RegisteredUser.create(name: "Andres", last_name: "Vial", username: "andresvial",age: 21, email_address: "avial5@miuandes.cl", google_account: "", password:"asdf", location: "Santiago")
user2 = RegisteredUser.create(name: "Matias", last_name: "Ponce", username: "matijojo",age: 21, email_address: "maponce@miuandes.cl", google_account: "", password:"adfg", location: "Santiago")
user3 = RegisteredUser.create(name: "Jojo", last_name: "Smith", username: "jotarito",age: 22, email_address: "compumundo@miuandes.cl", google_account: "", password:"sdfg", location: "Santiago")
user4 = RegisteredUser.create(name: "Julio", last_name: "Castro", username: "jululu",age: 28, email_address: "juliojaja@miuandes.cl", google_account: "", password:"toda", location: "Valparaiso")

event1 = Event.new(title: "JulioCon", description: "Convencion de julios", banner:"banner.png", location: "Melipilla", final_date: DateTime.now ,date_rule: "admin choose")
event2 = Event.new(title: "JojoCon", description: "Convencion de Jojo", banner:"banner.png", location: "Santiago", final_date: DateTime.now ,date_rule: "guests choose")
event3 = Event.new(title: "MatiasCon", description: "Convencion de matias", banner:"banner.png", location: "Santiago", final_date: DateTime.now ,date_rule: "admin choose")

event1.event_creator = user2
event2.event_creator = user1
event3.event_creator = user1

event1.save!
event2.save!
event3.save!

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

org1 = Organization.new(organization_banner: 'o1.png')
org1.organization_admin = user1
org1.save!

org2 = Organization.new(organization_banner: 'o2.png')
org2.organization_admin = user2
org2.save!

org3 = Organization.new(organization_banner: 'o3.png')
org3.organization_admin = user3
org3.save!

orgmem1 = OrganizationMember.new()
orgmem1.organization = org1
orgmem1.registered_user = user1
orgmem1.save!

orgmem2 = OrganizationMember.new()
orgmem2.organization = org2
orgmem2.registered_user = user2
orgmem2.save!

orgmem3 = OrganizationMember.new()
orgmem3.organization = org3
orgmem3.registered_user = user4
orgmem3.save!

admin1 = SystemAdministrator.new()
admin1.registered_user = user1
admin1.save!

bck_ls_1 = Blacklist.new()
bck_ls_1.blacklist_owner = user1
bck_ls_1.banned_user = user2
bck_ls_1.save!

bck_ls_2 = Blacklist.new()
bck_ls_2.blacklist_owner = user2
bck_ls_2.banned_user = user3
bck_ls_2.save!

bck_ls_3 = Blacklist.new()
bck_ls_3.blacklist_owner = user3
bck_ls_3.banned_user = user1
bck_ls_3.save!

com1 = Comment.new(profile_picture: 'p1.png',text: 'hola',image: 'p2.png')
com1.event = event1
com1.registered_user = user1
com1.save!

com2 = Comment.new(profile_picture: 'p3.png',text: 'wow!',image: 'p4.png')
com2.event = event2
com2.registered_user = user2
com2.save!

com3 = Comment.new(profile_picture: 'p5.png',text: 'Que loco!',image: 'p6.png')
com3.event = event1
com3.registered_user = user1
com3.save!

com4 = Comment.new(profile_picture: 'p7.png',text: 'Hola!',image: 'p8.png')
com4.event = event1
com4.registered_user = user3
com4.save!

rep1 = Reply.new(profile_picture: 'p7.png',text: 'Hola!',image: 'p8.png')
rep1.comment = com2
rep1.registered_user = user1
rep1.save!

rep2 = Reply.new(profile_picture: 'p7.png',text: 'Hola!',image: 'p8.png')
rep2.comment = com1
rep2.registered_user = user2
rep2.save!

msg1 = Message.new(text: 'Hola. Como estas?')
msg1.sender_user = user1
msg1.destination_user = user2
msg1.save!

msg2= Message.new(text: 'Chao')
msg2.sender_user = user2
msg2.destination_user = user3
msg2.save!

eguest1 = EventGuest.new(date_vote: 1)
eguest1.event = event1
eguest1.registered_user = user1
eguest1.save!

eguest2 = EventGuest.new(date_vote: 2)
eguest2.event = event2
eguest2.registered_user = user2
eguest2.save!

eimg1 = EventImage.new(image: 'a1.png')
eimg1.event = event1
eimg1.save!

eimg2 = EventImage.new(image: 'a2.png')
eimg2.event = event2
eimg2.save!

evid1 = EventVideo.new(video: 'v1.mp4')
evid1.event = event1
evid1.save!

evid2 = EventVideo.new(video: 'v2.mp4')
evid2.event = event2
evid2.save!

epdf1 = EventPdf.new(pdf: 'p1.pdf')
epdf1.event = event1
epdf1.save!

epdf2 = EventPdf.new(pdf: 'p2.pdf')
epdf2.event = event2
epdf2.save!