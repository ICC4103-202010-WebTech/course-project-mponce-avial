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
end