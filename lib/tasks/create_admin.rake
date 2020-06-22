require 'io/console'

namespace :admin do
  task :create_admin => :environment do
    passwd = ""
    loop do
      STDOUT.print "Enter password: "
      passwd = STDIN.noecho(&:gets).chomp
      STDOUT.print("\n")
      STDOUT.print "Confirm password: "
      passwd_confirm = STDIN.noecho(&:gets).chomp
      STDOUT.print("\n")
      if passwd_confirm != passwd
        puts "Passwords do not match, please try again"
      end
      break if passwd_confirm == passwd
    end
    admin = SystemAdministrator.new(:email => 'admin@ecalendar.com', :password => passwd, :password_confirmation => passwd)
    admin.save
  end
end