# README

# AN UPDATED E-R MODEL IS IN THIS REPOSITORY, PLEASE CHECK IT OUT

# To run the queries, please use the next command: 
```bash
rake db:model_queries
```

Matias Ponce : maponce@miuandes.cl
Andres Vial : avial5@miuandes.cl

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# 13), 14) and 15)

13) What should happen is that when the event is destroyed, our ActiveRecord 
will have a callback that will be called after destroying the event, in which 
the callback will go to the EventGuest table and destroy all the entries that have 
the foreign key "event" equal to the event that was destroyed.

14) What should happen is that when the organization is destroyed, our ActiveRecord 
will have a callback that will be called after destroying the organization, in 
which the callback will go to the Event table and destroy all entries that have 
the foreign key "organization" equal to the organization that was deleted.

15) What should happen is that when the user is destroyed, our ActiveRecord 
will have a callback that will be called after destroying the user, in 
which the callback will:

* a) Go to the table OrganizationAdmin and delete the entry in which the foreign 
key "admin" is equal to the user's id, also if the organization the user created has no more
administrators, the callback will delete the organization with all their members and events. 
Also, if the user was part of another organization as a member, his entry in the OrganizationMember
will be deleted by its foreign key.

* b) Go to the Event table and delete all the entries that have 
the foreign key "event" equal to the event that was destroyed. The callback will also delete all the 
entries of EventImages, EventVideo, EventPDF, Comment and Replies for events that the user created. 
After this, the callback of 13) will be called and the EventGuests assosiated will be eliminated.

* c) Go to the Comment table and first delete all replies that are assosiated with the foreign key of all the 
comments_id made by the user and then delete all the entries that have the foreign key "registered_user" equal 
to the user's id. 
