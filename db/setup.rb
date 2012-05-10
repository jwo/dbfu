require 'pg'
require 'active_record'
require 'yaml'

connection_details = YAML::load(File.open('config/database.yml'))

# connect to it
ActiveRecord::Base.establish_connection(connection_details)
# Migrate all the things
