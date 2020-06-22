user1 = RegisteredUser.create :email => "an@gmail.com", :password => '123123', :password_confirmation => '123123', :name =>'Andres', :last_name => 'Vial', :age => 21, :username => "andresvial", :location => "Santiago"
user2 = RegisteredUser.create :email => "ann@gmail.com", :password => '123123', :password_confirmation => '123123', :name =>'Matias', :last_name => 'Ponce', :age => 21, :username => "matijojo", :location => "Santiago"
user3 = RegisteredUser.create :email => "annn@gmail.com", :password => '123123', :password_confirmation => '123123', :name =>'Jojo', :last_name => 'Smith', :age => 21, :username => "jotarito", :location => "Santiago"
user4 = RegisteredUser.create :email => "annnn@gmail.com", :password => '123123', :password_confirmation => '123123', :name =>'Julio', :last_name => 'Castro', :age => 21, :username => "jululu", :location => "Santiago"
user5 = RegisteredUser.create :email => "ant@gmail.com", :password => '123123', :password_confirmation => '123123', :name =>'Nicolas', :last_name => 'Mena', :age => 21, :username => "nicomena", :location => "Santiago"
user6 = RegisteredUser.create :email => "antt@gmail.com", :password => '123123', :password_confirmation => '123123', :name =>'Valentina', :last_name => 'Aravena', :age => 21, :username => "valel", :location => "Santiago"
user7 = RegisteredUser.create :email => "anttt@gmail.com", :password => '123123', :password_confirmation => '123123', :name =>'Daniel', :last_name => 'Rodriguez', :age => 21, :username => "daniel2", :location => "Santiago"
user8 = RegisteredUser.create :email => 'abc2@example.com', :password => '123123', :password_confirmation => '123123', :name =>'Andres', :last_name => 'Vial', :age => 21, :username => "fasfffwfwef", :location => "dededed"

org1 = Organization.create(name: "Organization 1",organization_banner: 'o1.png',description: "The best organization in the world")

org2 = Organization.create(name: "Organization 2",organization_banner: 'o2.png',description: "The best organization in the world")

org3 = Organization.create(name: "Organization 3",organization_banner: 'o3.png',description: "The best organization in the world")

org4 = Organization.create(name: "Organization 4",organization_banner: 'o4.png',description: "The best organization in the world")

org5 = Organization.create(name: "Organization 5",organization_banner: 'o5.png',description: "The best organization in the world")

org6 = Organization.create(name: "Organization 6",organization_banner: 'o6.png',description: "The best organization in the world")

event1 = Event.new(title: "JulioCon", description: "Convencion de julios", banner:"banner.png", location: "Melipilla", final_date: DateTime.now ,date_rule: "admin choose")
event2 = Event.new(title: "JojoCon", description: "Convencion de Jojo", banner:"banner.png", location: "Santiago", final_date: DateTime.now ,date_rule: "guests choose")
event3 = Event.new(title: "MatiasCon", description: "Convencion de matias", banner:"banner.png", location: "Santiago", final_date: DateTime.now ,date_rule: "admin choose",visibility: "private")
event4 = Event.new(title: "RichardCon", description: "Convencion de richards", banner:"banner.png", location: "Melipilla", final_date: DateTime.now ,date_rule: "guests choose",visibility: "public")
event5 = Event.new(title: "WebCon", description: "Convencion de Web", banner:"banner.png", location: "Arica", final_date: DateTime.now ,date_rule: "guests choose",visibility: "public")
event6 = Event.new(title: "Asado Familiar", description: "Asado para reunir a la familia", banner:"banner.png", location: "Melipilla", final_date: DateTime.now ,date_rule: "admin choose")
event7 = Event.new(title: "Junta Piola", description: "Junta de amigos", banner:"banner.png", location: "Santiago", final_date: DateTime.now ,date_rule: "guests choose")
event8 = Event.new(title: "Carrete en casa", description: "Carrete de amigos", banner:"banner.png", location: "Valparaiso", final_date: DateTime.now ,date_rule: "admin choose",visibility: "private")
event9 = Event.new(title: "Partido de Futbol", description: "Partido", banner:"banner.png", location: "Melipilla", final_date: DateTime.now ,date_rule: "guests choose",visibility: "public")
event10 = Event.new(title: "Partido de Basketball", description: "Partido", banner:"banner.png", location: "Santiago", final_date: DateTime.now ,date_rule: "guests choose",visibility: "public")


event1.event_creator = user2
event2.event_creator = user1
event3.event_creator = user1
event4.event_creator = user3
event5.event_creator = user1
event6.event_creator = user1
event7.event_creator = user1
event8.event_creator = user6
event9.event_creator = user7
event10.event_creator = user8

event3.organization = org1
event4.organization = org3
event5.organization = org1
event6.organization = org4
event7.organization = org5
event8.organization = org6
event9.organization = org5

event1.save!
event2.save!
event3.save!
event4.save!
event5.save!
event6.save!
event7.save!
event8.save!
event9.save!
event10.save!

profileuser1 = UserProfile.new(profile_picture: "p1.png", banner_picture: "p1b.png",biography: "Hi, hi, hi")
profileuser1.registered_user = user1
profileuser1.save!

profileuser2 = UserProfile.new(profile_picture: "p2.png", banner_picture: "p2b.png",biography: "Hola Hola Hola")
profileuser2.registered_user = user2
profileuser2.save!

profileuser3 = UserProfile.new(profile_picture: "p3.png", banner_picture: "p3b.png",biography: "Ora Ora Ora")
profileuser3.registered_user = user3
profileuser3.save!

profileuser4 = UserProfile.new(profile_picture: "p4.png", banner_picture: "p4b.png",biography: "Hola, Buenas Tardes")
profileuser4.registered_user = user4
profileuser4.save!

profileuser5 = UserProfile.new(profile_picture: "p1.png", banner_picture: "p1b.png",biography: "Hi, hi, hi")
profileuser5.registered_user = user5
profileuser5.save!

profileuser6 = UserProfile.new(profile_picture: "p2.png", banner_picture: "p2b.png",biography: "Hola Hola Hola")
profileuser6.registered_user = user6
profileuser6.save!

profileuser7 = UserProfile.new(profile_picture: "p3.png", banner_picture: "p3b.png",biography: "Ora Ora Ora")
profileuser7.registered_user = user7
profileuser7.save!

profileuser8 = UserProfile.new(profile_picture: "p4.png", banner_picture: "p4b.png",biography: "Hola, Buenas Tardes")
profileuser8.registered_user = user8
profileuser8.save!



org_admin1 = OrganizationAdmin.new()
org_admin1.organization = org1
org_admin1.admin = user1
org_admin1.save!

org_admin2 = OrganizationAdmin.new()
org_admin2.organization = org2
org_admin2.admin = user2
org_admin2.save!

org_admin3 = OrganizationAdmin.new()
org_admin3.organization = org3
org_admin3.admin = user3
org_admin3.save!

org_admin4 = OrganizationAdmin.new()
org_admin4.organization = org4
org_admin4.admin = user1
org_admin4.save!

org_admin5 = OrganizationAdmin.new()
org_admin5.organization = org5
org_admin5.admin = user6
org_admin5.save!

org_admin6 = OrganizationAdmin.new()
org_admin6.organization = org6
org_admin6.admin = user7
org_admin6.save!


orgmem1 = OrganizationMember.new()
orgmem1.organization = org2
orgmem1.registered_user = user1
orgmem1.save!

orgmem2 = OrganizationMember.new()
orgmem2.organization = org2
orgmem2.registered_user = user2
orgmem2.save!

orgmem3 = OrganizationMember.new()
orgmem3.organization = org3
orgmem3.registered_user = user3
orgmem3.save!

orgmem4 = OrganizationMember.new()
orgmem4.organization = org4
orgmem4.registered_user = user4
orgmem4.save!

orgmem5 = OrganizationMember.new()
orgmem5.organization = org5
orgmem5.registered_user = user5
orgmem5.save!

orgmem6 = OrganizationMember.new()
orgmem6.organization = org6
orgmem6.registered_user = user6
orgmem6.save!

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

bck_ls_4 = Blacklist.new()
bck_ls_4.blacklist_owner = user4
bck_ls_4.banned_user = user2
bck_ls_4.save!

bck_ls_5 = Blacklist.new()
bck_ls_5.blacklist_owner = user5
bck_ls_5.banned_user = user3
bck_ls_5.save!

bck_ls_6 = Blacklist.new()
bck_ls_6.blacklist_owner = user6
bck_ls_6.banned_user = user7
bck_ls_6.save!

bck_ls_7 = Blacklist.new()
bck_ls_7.blacklist_owner = user7
bck_ls_7.banned_user = user5
bck_ls_7.save!

bck_ls_8 = Blacklist.new()
bck_ls_8.blacklist_owner = user8
bck_ls_8.banned_user = user4
bck_ls_8.save!


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

com5 = Comment.new(profile_picture: 'p1.png',text: 'hola',image: 'p2.png')
com5.event = event1
com5.registered_user = user1
com5.save!

com6 = Comment.new(profile_picture: 'p3.png',text: 'Buenas!',image: 'p4.png')
com6.event = event3
com6.registered_user = user4
com6.save!

com7 = Comment.new(profile_picture: 'p5.png',text: 'Hola a todos!',image: 'p6.png')
com7.event = event5
com7.registered_user = user1
com7.save!

com8 = Comment.new(profile_picture: 'p7.png',text: 'Como estan?',image: 'p8.png')
com8.event = event5
com8.registered_user = user3
com8.save!

com9 = Comment.new(profile_picture: 'p3.png',text: 'Cual es la fecha?',image: 'p4.png')
com9.event = event2
com9.registered_user = user2
com9.save!

com10 = Comment.new(profile_picture: 'p5.png',text: 'Que loco!',image: 'p6.png')
com10.event = event4
com10.registered_user = user1
com10.save!


rep1 = Reply.new(profile_picture: 'p7.png',text: 'Holas!',image: 'p8.png')
rep1.comment = com2
rep1.registered_user = user1
rep1.save!

rep2 = Reply.new(profile_picture: 'p7.png',text: 'Oka!',image: 'p8.png')
rep2.comment = com1
rep2.registered_user = user2
rep2.save!

rep3 = Reply.new(profile_picture: 'p7.png',text: 'Holas!',image: 'p8.png')
rep3.comment = com2
rep3.registered_user = user1
rep3.save!

rep4 = Reply.new(profile_picture: 'p7.png',text: 'Oka!',image: 'p8.png')
rep4.comment = com4
rep4.registered_user = user2
rep4.save!

rep5 = Reply.new(profile_picture: 'p7.png',text: 'Holas!',image: 'p8.png')
rep5.comment = com5
rep5.registered_user = user3
rep5.save!

rep6 = Reply.new(profile_picture: 'p7.png',text: 'Oka!',image: 'p8.png')
rep6.comment = com6
rep6.registered_user = user4
rep6.save!

rep7 = Reply.new(profile_picture: 'p7.png',text: 'Oka!',image: 'p8.png')
rep7.comment = com7
rep7.registered_user = user2
rep7.save!

rep8 = Reply.new(profile_picture: 'p7.png',text: 'Holas!',image: 'p8.png')
rep8.comment = com8
rep8.registered_user = user3
rep8.save!

rep9 = Reply.new(profile_picture: 'p7.png',text: 'Oka!',image: 'p8.png')
rep9.comment = com9
rep9.registered_user = user4
rep9.save!

msg1 = Message.new(text: 'Hola. Como estas?')
msg1.sender_user = user1
msg1.destination_user = user2
msg1.save!

msg2= Message.new(text: 'Chao')
msg2.sender_user = user2
msg2.destination_user = user1
msg2.save!

msg3 = Message.new(text: 'Hola. Como estas?')
msg3.sender_user = user1
msg3.destination_user = user2
msg3.save!

msg4= Message.new(text: 'HOLAAAAAAAAAAA')
msg4.sender_user = user2
msg4.destination_user = user1
msg4.save!

eguest1 = EventGuest.new(date_vote: 1)
eguest1.event = event1
eguest1.registered_user = user1
eguest1.save!

eguest2 = EventGuest.new(date_vote: 2)
eguest2.event = event2
eguest2.registered_user = user2
eguest2.save!

eguest3 = EventGuest.new(date_vote: 1)
eguest3.event = event2
eguest3.registered_user = user3
eguest3.save!

eguest4 = EventGuest.new(date_vote: 1)
eguest4.event = event4
eguest4.registered_user = user3
eguest4.save!

eguest5 = EventGuest.new(date_vote: 2)
eguest5.event = event5
eguest5.registered_user = user1
eguest5.save!

eguest6 = EventGuest.new(date_vote: 1)
eguest6.event = event6
eguest6.registered_user = user1
eguest6.save!

eguest7 = EventGuest.new(date_vote: 1)
eguest7.event = event2
eguest7.registered_user = user1
eguest7.save!

eguest8 = EventGuest.new(date_vote: 3)
eguest8.event = event1
eguest8.registered_user = user2
eguest8.save!

eguest8 = EventGuest.new(date_vote: 3)
eguest8.event = event3
eguest8.registered_user = user1
eguest8.save!

eguest9 = EventGuest.new(date_vote: 3)
eguest9.event = event7
eguest9.registered_user = user1
eguest9.save!

eguest10 = EventGuest.new(date_vote: 3)
eguest10.event = event8
eguest10.registered_user = user6
eguest10.save!

eguest11 = EventGuest.new(date_vote: 3)
eguest11.event = event9
eguest11.registered_user = user7
eguest11.save!

eguest12 = EventGuest.new(date_vote: 3)
eguest12.event = event10
eguest12.registered_user = user8
eguest12.save!

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