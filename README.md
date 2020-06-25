# README

# Course Project Part 1

## AN UPDATED E-R MODEL IS IN THIS REPOSITORY, PLEASE CHECK IT OUT

## To run the queries, please use the next command: 
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

## 13), 14) and 15)

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

# Course Project Part 2

## Summary of implemented features

* Added routes for api and non api page of:
    * inbox
    * system_administrators
    * registered_users
    * user_profiles
    * events
    * messages
    * comments
    * replies
    * organizations
    * organization_admins
    * organization_members
    * event_guests
    * event_images
    * event_pdfs
    * event_videos
    * blacklists

* Added controllers and views for:
    * All of te above
    * Homepage
    * Application layout

* Added html elements to view and some css to some views

## Summary of thing required for this assigment but pending

We didn't make the CSS for the inbox view

## API Tests

Postman link: https://www.getpostman.com/collections/6579499dc7e32a9305a1

# Course Project Part 3

## Summary of implemented features:

NOTE: to access the admin namespace, you have to go to localhost:3000/admin

* Added CRUD operations and namespace of system administration of:
    * Organizations
    * Events
    * Comments

* Added user profile features:
    * View the profile
    * Edit the profile
    * Edit the user atributes (bio, location, name, last name)
    * See events that the user has created
    * See events that the user is invited

* Added organization features:
   * View the organization
   * Edit the organization
   * Show public events
   
* Added events features:
   * View the event (info and banner image)
   * View the attachemnets (image, videos and pdf)
   * Vote for the date
   * Invite people
   * Delete event
   * Edit event
   * Add comments
   * Shown the comments
   
* Added search bar to the navbar:
   * The search is done in 5 ways:
      * Search by user
      * Search by organization
      * Search event by organization
      * Search event by title/description
      * Search event by its creator
      
# Course Project Part 4 (FINAL)

## Summary of implemented features:

NOTE 1: to access the admin namespace, you have to go to localhost:3000/admin, we dont plan to make a button for this because in the logic of an actual page this would be the case.

NOTE 2: to create an admin, you have to do it by running the rake admin:create_admin command, which will create an admin account with the email: admin@ecalendar.com

NOTE 3: if you can't find the recovery password email, search in the spam section, and move it to your main mailbox for the links to appear on the body of the email (because gmail automatically removes links of spam emails).

* Added User authentication (with Devise gem) logic:
   * You can register with an email and password or you can log in with a google account.
   * You can request E-Calendar to send you a recovery password email if you forgot your password.
   * You can change your email address and password (there is a link for this located in the edit section of your profile).
   * In the same section as before, you can also delete your account (although it will be very sad if you do it).
   * You can select "remember me" when you log in to maintain your session even if you close the page.
   
* Added User authorization (with CanCanCan gem) logic:
   * Added CanCanCan to UserProfiles.
   * Added CanCanCan to Events.
   * Added CanCanCan to Comments.
   * Added CanCanCan to Replies.
   * Added CanCanCan to Organizations.
   * Added CanCanCan to Admins.
   
* Organization:
   * Organizations now have a "members" button which will redirect to a page with a list of the members and admins of the organization.
   * Organizations admins can add members and more admins in the members page of the organization (and delete both of them).
   * Organization admins can delete the organization.
   
* Event:
   * Events now have a "guests" button which will redirect to a page with a list of the guests of the event.
   * Events creators can add guests in the guests page of the event (and also delete them).
   * When creating an event, the event creator now has to specifify the minimum number of votes to define the final date of the event and also 
   has to specify if he wants to select the date manually or automatically.
   
* Reports:
   * Added a "report" button to:
      * Users
      * Events
      * Organizations
   * In the admin namespace sidebar, there is now a sections for the reports, where the admin can see all the reports and manage them.
   
* Replies:
   * Now you can press the reply button on a comment to make a form appear below it to create a reply.
   * Now replies can be deleted and edited by its creator.
   
* Comments:
   * Now comments can be deleted and edited by its creator.
   
* Users:
   * Added "Last connection" in the profile
   
* Admin:
   * Added the report section 
   * Added the Users section, in which the admin can deleted, see, and edit users.
   * In the users section, you may note that in the "Last Connection" column there are empty values, this is only for the users that were generated by the seed file, because they were created but they haven't actually log in.
   
* Inbox:
   * Now users can send and read messages between them by going to the inbox button at the top of the screen.

## Summary of thing required for this assigment but pending or bugs:

* The reply button is not working on a comment if the page your are in was redirect from somewhere else, it should be fixed if you reload the page (sometimes, we don't know how to tirgger the bug anymore)
