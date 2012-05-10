require "rubygems"
require "bundler/setup"
require 'pg'
require 'active_record'

require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

namespace :db do

	desc 'Create dat DB'
	task :create do
		
		connection_details = YAML::load(File.open('config/database.yml'))
		ActiveRecord::Base.establish_connection(connection_details.merge({'database'=> 'postgres', 'schema_search_path'=> 'public'}))
		ActiveRecord::Base.connection.drop_database (connection_details.fetch('database')) rescue nil
		ActiveRecord::Base.connection.create_database(connection_details.fetch('database')) rescue nil
	end


	desc 'Migrate dat DB'
	task :migrate do
		connection_details = YAML::load(File.open('config/database.yml'))
		ActiveRecord::Base.establish_connection(connection_details)
		ActiveRecord::Migrator.migrate("db/migrate/")
	end
end


task :say_hi do
	puts "hi"
end
