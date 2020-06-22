namespace :db do
  task :populate => :environment do
    Rake::Task["db:drop:all"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end