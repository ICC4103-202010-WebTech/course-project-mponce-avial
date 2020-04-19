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


  /task :model_queries => :environment do
    puts("Query 1: numbers of tickets by a given customer")
    r = Customer.find(5).tickets.count
    puts(r)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 2: Total number of different events that a given customer has attended")
    r = Event.joins(ticket_types: {tickets: :order}).where(orders: {customer_id: 1}).select(:name).distinct.count
    puts(r)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 3: name of events attended by customer")
    r = Event.joins(ticket_types: {tickets: :order}).where(orders: {customer_id: 1}).select(:name).distinct.pluck(:name)
    puts(r)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 4: Total number of tickets sold for an event")
    r = Ticket.joins(ticket_type: :event).where(events: {id: 1}).count
    puts(r)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 5: Total sales of an event")
    r = Event.joins(ticket_types: :tickets).where(id: '1').sum(:ticket_price)
    puts(r)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 6: The event that has been most attended by women")
    r = Event.joins(ticket_types: {tickets: {order: :customer}}).where(customers: {gender: "f"}).group(:id).count.max
    puts(r)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :model_queries => :environment do
    puts("Query 7:  The event that has been most attended by men ages 18 to 30")
    r = Customer.joins(tickets: [ticket_type: :event]).where("gender = 'm' and age >= 18 and age<=30").group('events.name').count.max
    puts(r)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end/
end