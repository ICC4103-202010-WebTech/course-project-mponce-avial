namespace :db do
  task :model_queries => :environment do
    puts("Query 1: Get all events created by certain user")
    r = Event.joins(:event_creator).where(event_creator: 1).select(:title).pluck(:title)
    puts(r)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 2: Get all users belonging to an organization")
    OrganizationMember.joins(:registered_user).each do |org|
      puts (org.registered_user.name + " " + org.registered_user.last_name)
    end
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 3: Get all public events in an organization")
    Event.joins(:organization).where(organization: 3, visibility: "public").each do |eve|
      puts (eve.title)
    end
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 4: Get all private events in an organization")
    Event.joins(:organization).where(organization: 1, visibility: "private").each do |eve|
      puts (eve.title)
    end
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 5: Get all guests that have been invited to a certain event")
    EventGuest.joins(:registered_user).where(event: 2).each do |eg|
      puts (eg.registered_user.name + " " + eg.registered_user.last_name)
    end
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 6: Get all guests that have voted for a date option in a certain event")
    EventGuest.joins(:registered_user).where(event: 2, date_vote:2).each do |eg|
      puts (eg.registered_user.name + " " + eg.registered_user.last_name)
    end
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 7: Get all comments written by users on a specific event")
    Comment.joins(:event).where(event: 1).each do |com|
      puts (com.text)
    end
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 8: Get all comments written by a specific user on all events")
    Comment.joins(:event).where(registered_user: 1).each do |com|
      puts (com.text)
    end
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 9: Get all users with administrative privileges in an organization")
    OrganizationAdmin.joins(:admin).where(organization: 3).each do |org|
      puts (org.admin.name + " " + org.admin.last_name)
    end
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 10: Get all users with administrative privileges in the system")
    SystemAdministrator.joins(:registered_user).each do |sys|
      puts (sys.registered_user.name + " " + sys.registered_user.last_name)
    end
    puts("EOQ") # End Of Query -- always add this line after a query.
  end
end