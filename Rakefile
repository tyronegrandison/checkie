# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :contractors do
  def contractor_count
    puts Contractor.count
  end

  desc 'destroys all the records from the contractors table'
  task :destroy_all => :environment do
    Contractor.destroy_all
    contractor_count
  end

  desc 'outputs the number of records in the contractors table'
  task :count => :environment do
    contractor_count
  end

  desc 'import into contractors table from XML file'
  task :import => :environment do
    Contractor.import_xml 'spec/fixtures/osha-compliance-100.xml'
    contractor_count
  end

end
